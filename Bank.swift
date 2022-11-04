//
//  Bank.swift
//  Banking
//
//  Created by vishnu-pt6278 on 20/10/22.
//

import Foundation

//class Bank{
//
//
//    let name: String
//    let bankDB: BankDB
//    let transactionManager: TransactionServices
//
//    public init(name: String, bankDB: BankDB, transactionManager: TransactionServices) {
//        self.name = name
//        self.bankDB = bankDB
//        self.transactionManager = transactionManager
//    }
//
//}
class BankUtils{
    
    private static var tnxCt = 0
    private static var ifscCt = 0
    private static var saCt = 0
    
    static func tnxId()->String{
        tnxCt += 1
        return "TNX" + String(tnxCt)
    }
    
    static func savingsAccNo()->String{
        saCt += 1
        return "131200" + String(saCt)
    }
    static func ifsc()->String{
        ifscCt += 1
        return "SABK00" + String(ifscCt)
    }
}
