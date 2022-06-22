const RoomFactory = artifacts.require("RoomFactory.sol");

module.exports = function (deployer) {
  deployer.deploy(RoomFactory).then(instance => {
    console.log('ABI:', JSON.stringify(instance.abi))
  })
};
