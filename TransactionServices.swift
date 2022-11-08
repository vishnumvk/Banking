//
//  TransactionManager.swift
//  Banking
//
//  Created by vishnu-pt6278 on 19/10/22.
//

import Foundation

protocol TransactionsDB{
    
    
    func logTNX(accNo: String,_ tnx: Transaction)
    func getTransactionsOf(accNo: String)->[Transaction]?
    
}

enum TransactionErrors: Error{
    case insufficientFunds,cannotTransferToSelf,beneficiaryNotFound
}



class TransactionServices{
    init(db: TransactionsDB) {
        self.db = db
    }
    
    
    let db : TransactionsDB
    
    
    func deposit(_ target: SavingsAccount,amount: Double,by: String = "self-tnxservices")->Transaction{
        target.balance += amount
        let tnx = Transaction(tID: BankUtils.newTnxId(), by: by, date: Date(), amount: amount, type: .credit)
        db.logTNX(accNo: target.accountNumber, tnx)
        return tnx
    }
    
    func withdraw(_ target: SavingsAccount,amount: Double,by: String = "self-tnxservices")throws->Transaction{
        guard target.balance >= amount else{throw TransactionErrors.insufficientFunds}
        target.balance -= amount
        let tnx = Transaction(tID: BankUtils.newTnxId(), by: by, date: Date(), amount: amount, type: .debit)
        db.logTNX(accNo: target.accountNumber, tnx)
        return tnx
    }
    
    func transfer(from sender: SavingsAccount,to reciever: SavingsAccount, amount: Double,senderName: String, beneficiaryName: String)throws-> Transaction{
        let senderEndTnx: Transaction
        do{
            senderEndTnx = try withdraw(sender, amount: amount, by: "transfer-To: \(beneficiaryName)")
        }catch{
            throw error
        }
        _ = deposit(reciever, amount: amount, by: "payment-from: \(senderName)")
        return senderEndTnx
    }
    
    
    
}
