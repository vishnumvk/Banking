//
//  Transaction.swift
//  Banking
//
//  Created by vishnu-pt6278 on 19/10/22.
//

import Foundation

protocol Transaction{
    
    var amount: Float { get }
    var TID: Int { get }
    var by: String { get }
    var date: Date { get }
    
}

struct DepositTransaction: Transaction{
    let TID: Int
    
    let by: String
    
    let date: Date
    
    let amount: Float
    
    
}


struct WithDrawTransaction: Transaction{
    let TID: Int
    
    let by: String
    
    let date: Date
    
    let amount: Float
    
    
}

