//
//  Transaction.swift
//  Banking
//
//  Created by vishnu-pt6278 on 19/10/22.
//

import Foundation

enum TransactionType: String,Codable{
    case credit
    case debit
}

struct Transaction: CustomStringConvertible,Codable{
    var description: String{
        let type = self.type.rawValue
        let paddedType = type.padding(toLength: 8, withPad: " ", startingAt: 0)
        return "TID: \(self.tID)  \(self.date)   credit/debit: \(paddedType) amount:\(String(format: "%10.2f", self.amount))  by: \(self.by)"
    }
    
    let tID: String
    
    let by: String
    
    let date: Date
    
    let amount: Double
    
    let type: TransactionType
}


