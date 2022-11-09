//
//  BankDB.swift
//  Banking
//
//  Created by vishnu-pt6278 on 20/10/22.
//

import Foundation
enum jsonFileErrors: Error{
    case dataNotFound
    case encodingError
}

class BankDB: TransactionsDB,UserDB,UserServicesDB,Codable{
    
    
    private init(){
    }
    
    static let shared = loadSampleData()
    static let dataBaseFileUrl = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Desktop/projects/banking/Banking/bankDB.json")
    
    var transactionDB : [String : [Transaction]]=[:] //[account number : [transactions]]
    var userDB: [String  : User] = [:]               //[phone number : user]
    var accDB: [String : SavingsAccount] = [:]       //[userID : savings account]
    
    
    private static func loadSampleData()->BankDB{
        
        let data = try? String(contentsOf: dataBaseFileUrl).data(using: .utf8)
        let decoder = JSONDecoder()
        
        do{
            guard let data else{ throw jsonFileErrors.dataNotFound }
            let db = try decoder.decode(BankDB.self, from: data)
            return db
        }
        catch{
            print(error)
            print("failed to load json data")
            print("loaded empty db")
            return BankDB()
        }
    }
    
    func userName(userID: String) -> String {
        return userDB[userID]!.name
    }
    
    func getSavingsAccount(userID: String) -> SavingsAccount? {
            return accDB[userID]
    }
    
    func addSavingsAcc(userID: String, _ newAcc: SavingsAccount) {
        accDB[userID] = newAcc
    }
    
    func logTNX(accNo: String, _ tnx: Transaction) {
        transactionDB[accNo,default: []].append(tnx)
    }
    
    func getTransactionsOf(accNo: String) -> [Transaction]? {
        return transactionDB[accNo]
    }
    
    func addUser(_ user: User) {
        userDB[user.phonenumber] = user
    }
    
    func getUserBy(phoneNumber: String) -> User? {
      return userDB[phoneNumber]
    }

}

