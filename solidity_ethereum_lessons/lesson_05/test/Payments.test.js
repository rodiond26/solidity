const { expect } = require("chai")
const { ethers } = require("hardhat")


describe("Payments", function () {
    // 1. Развернуть в локальном блокчейне
    let acc1
    let acc2
    let payments

    beforeEach(async function () {
        [acc1, acc2] = await ethers.getSigners()

        const Payments = await ethers.getContractFactory("Payments", acc1)
        const payments = await Payments.deploy()

        await payments.deployed();

        // // payments = await Payments.deploy()
        // // await payments.deployed()
        // payments = await Payments.waitForDeployment()
    })

    it("It should be deployed", async function () {
        console.log('success');


        // expect(payments.properAddress).to.be.properAddress
    })

    it("It should have 0 ethers ", async function () {
        const balance = await payments.currentBalance();
        console.log(balance);

        // expect(payments.properAddress).to.be.properAddress
    })
})
