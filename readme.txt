1. Geth init
$ geth --datadir ~/private-net --nodiscover --maxpeers 0 init ~/private-net/genesis.json

2. Geth run
$ geth --datadir ~/private-net --networkid 15 \
  --nodiscover --maxpeers 0 --mine --miner.threads 1 \
  --http --http.addr "0.0.0.0" --http.corsdomain "*" \
  --http.vhosts "*" --http.api "eth,web3,personal,net,miner" \
  --ipcpath ~/private-net/geth.ipc --ws --ws.addr "0.0.0.0" \
  --ws.api "eth,web3,personal,net,miner" --ws.origins "*" \
  --allow-insecure-unlock --password ~/private-net/password

3. Accounts unlock
$ geth attach http://localhost:8545
> web3.personal.unlockAccount(eth.accounts[0])
> Passphrase: blah

4. Migrations
$ truffle migrate --reset

5. 계약 개체 정의(3번 Geth 콘솔에서, 4번 migrate 정보로 입력)
$ var roomFactory = eth.contract(<ABI>).at("계약주소")


## For Test
1. Openzepplin test env. install
$ npm install --save-dev @openzeppelin/test-environment @openzeppelin/test-helpers mocha chai chai-as-promised


## For solidity-coverage
1. insall package 
$ npm install --save-dev solidity-coverage
$ npm install --save-dev ganache-cli@6.12.2

2. make .solcover.js in working dir.
module.exports = {
    client: require('ganache-cli'),
};

3. in package.json
  "scripts": {
    "test": "npx mocha --exit --recursive test",
    "coverage": "solidity-coverage"  // <--
  },

4. in truffle-config.js
module.exports = {
  networks: {...},  

  plugins: ["solidity-coverage"] 
}




