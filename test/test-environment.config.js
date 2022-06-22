module.exports = {
    accounts: {
        amount: 10, // 계정 잠금을 해제한 계정 숫자
        ether: 100, // 잠금 해제한 계정의 초기 잔액
    },

    contracts: {
        type: 'truffle', // 사용할 계정 추상화
        defaultGas: 6e6, // 최대 가스량
    },

    blockGasLimit: 8e6, //블럭당 최대 가스량
};