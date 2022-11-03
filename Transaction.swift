//
//  Transaction.swift
//  Banking
//
//  Created by vishnu-pt6278 on 19/10/22.
//

import Foundation

//protocol Transaction{
//
//    var amount: Float { get }
//    var TID: Int { get }
//    var by: String { get }
//    var date: Date { get }
//
//}

enum TransactionType: String{
    case credit
    case debit
}

struct Transaction{
    let TID: Int
    
    let by: String
    
    let date: Date
    
    let amount: Double
    
    let type: TransactionType
}


//struct Debit: Transaction{
//    let TID: Int
//
//    let by: String
//
//    let date: Date
//
//    let amount: Float
//
//
//}
//
