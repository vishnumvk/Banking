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





class TransactionServices{
    
    
    
    
    func deposit(target: BankAccount,amount: Float){
        
    }
    
    func withdraw(target: BankAccount,amount: Float){
        
    }
    
    
    
    
    init() {
        
    }
}
