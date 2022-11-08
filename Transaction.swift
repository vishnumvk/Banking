//
//  Transaction.swift
//  Banking
//
//  Created by vishnu-pt6278 on 19/10/22.
//

import Foundation

enum TransactionType: String,Codable{
    case credit
    case debit = "debit "
}

struct Transaction: CustomStringConvertible,Codable{
    var description: String{
        return "TID: \(self.tID)  \(self.date)   credit/debit: \(self.type.rawValue)  amount: \(String(format: "%10.2f", self.amount))    by: \(self.by)"
    }
    
    let tID: String
    
    let by: String
    
    let date: Date
    
    let amount: Double
    
    let type: TransactionType
}


