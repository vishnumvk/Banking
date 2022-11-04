//
//  BankDB.swift
//  Banking
//
//  Created by vishnu-pt6278 on 20/10/22.
//

import Foundation

class BankDB: TransactionsDB,UserDB,UserServicesDB,Codable{
    
    private init(){
    }
    
    static var db = BankDB()
    
    var transactionDB : [String : [Transaction]]=[:]
    var userDB: [String  : User] = [:]
    var accDB: [String : SavingsAccount] = [:]
    
    
    func getSavingsAccount(userID: String) -> SavingsAccount {
        if let acc = accDB[userID]{
            return acc
        }
        else{
            accDB[userID] = SavingsAccount(accountNumber: BankUtils.savingsAccNo(), IFSC: BankUtils.ifsc(), balance: 0.00)
            return accDB[userID]!
        }
        
    }
    
    
    func logTNX(accNo: String, _ tnx: Transaction) {
//        if var accPassBook = transactionDB[accNo]{
//            accPassBook.append(tnx)
//        }else{
//            transactionDB[accNo] = [tnx]
//        }
        
        transactionDB[accNo,default: []].append(tnx)
    }
    
    func getTransactionsOf(accNo: String) -> [Transaction]? {
        return transactionDB[accNo]
    }
    func addUser(_ user: User) {
        userDB[user.phonenumber] = user
    }
    
    func getUserBy(phoneNumber: String) -> User? {
        if let user = userDB[phoneNumber]{
            return user
        }
        else {
            return nil
        }
    }
//    deinit {
//        let encoder = JSONEncoder()
//        let data = try! encoder.encode(self)
//        print(String(data: data, encoding: .utf8)!)
//    }
}

