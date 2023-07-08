const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Demo", function () {
    let owner;
    let other_addr;
    let demo;

    console.log("log ", 0);

    beforeEach(async function () {
        [owner, other_addr] = await ethers.getSigners();
        const DemoContract = await ethers.getContractFactory("Demo", owner);
        demo = await DemoContract.deploy();

        console.log("log ", 3);
        await demo.waitForDeployment();
        console.log("log ", 4);
    });

    async function sendMoney(sender) {
        const amount = 100;
        const txData = {
            to: demo.getAddress(),
            value: amount
        };

        const tx = await sender.sendTransaction(txData);
        await tx.wait();

        return [tx, amount];
    }

    it("should allow to send money", async function () {
        const [sendMoneyTx, amount] = await sendMoney(other_addr);

        console.log(sendMoneyTx);
    });

    it("should allow to send money 2", async function () {
        const [sendMoneyTx, amount] = await sendMoney(other_addr);

        console.log(5);
        await expect(() => sendMoneyTx).to.changeEtherBalance(demo, amount);
    });

    it("should allow to send money 3", async function () {
        console.log(6);

        const [sendMoneyTx, amount] = await sendMoney(other_addr);
        await expect(() => sendMoneyTx).to.changeEtherBalance(demo, amount);

        const timestamp = (
            ethers.provider.getBlock(sendMoneyTx.blockNumber)
        ).timestamp;

        await expect(sendMoneyTx)
            .to.emit(demo, "Paid")
            .withArgs(other_addr.getAddress(), amount, timestamp);
    });

    it("should allow owner to withdraw funds", async function () {
        const [_, amount] = await sendMoney(other_addr);

        const tx = await demo.withdraw(owner.getAddress());

        await expect(() => tx)
            .to.changeEtherBalances([demo, owner], [-amount, amount]);
    });

    it("should not allow other accounts to withdraw funds", async function () {
        await sendMoney(other_addr);

        await expect(demo.connect(other_addr).withdraw(owner.getAddress()))
            .to.be.revertedWith("you are not an owner");
    });
});
