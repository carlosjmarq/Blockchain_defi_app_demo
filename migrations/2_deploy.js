const CorcheaToken = artifacts.require("Corchea_Token");


module.exports = async function(deployer) {
	//deploy Token
	await deployer.deploy(CorcheaToken)
};