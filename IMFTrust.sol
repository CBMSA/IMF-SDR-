
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TrustAllocator {
    enum LoanType { PRGT, RST }

    struct Loan {
        address borrower;
        uint256 amount;
        LoanType loanType;
        uint256 interestRate;
        uint256 maturityDate;
        uint256 gracePeriod;
    }

    address public admin;
    Loan[] public loans;

    constructor() {
        admin = msg.sender;
    }

    function requestLoan(
        uint256 _amount,
        LoanType _loanType,
        uint256 _interestRate,
        uint256 _maturityDate,
        uint256 _gracePeriod
    ) external {
        loans.push(Loan({
            borrower: msg.sender,
            amount: _amount,
            loanType: _loanType,
            interestRate: _interestRate,
            maturityDate: _maturityDate,
            gracePeriod: _gracePeriod
        }));
    }

    function getLoanCount() external view returns (uint) {
        return loans.length;
    }

    function getLoan(uint index) external view returns (
        address borrower,
        uint256 amount,
        LoanType loanType,
        uint256 interestRate,
        uint256 maturityDate,
        uint256 gracePeriod
    ) {
        Loan memory loan = loans[index];
        return (
            loan.borrower,
            loan.amount,
            loan.loanType,
            loan.interestRate,
            loan.maturityDate,
            loan.gracePeriod
        );
    }
}
