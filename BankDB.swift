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
    
    static let shared = loadSampleData()
    
    var transactionDB : [String : [Transaction]]=[:] //[account number : [transactions]]
    var userDB: [String  : User] = [:]               //[phone number : user]
    var accDB: [String : SavingsAccount] = [:]       //[userID : savings account]
    
    
    private static func loadSampleData()->BankDB{
        let jstring = """
        {"userDB":{"8309914972":{"name":"vishnu","password":"1234","phonenumber":"8309914972"},"9949168919":{"name":"sai","password":"2242","phonenumber":"9949168919"}},"transactionDB":{},"accDB":{"8309914972":{"balance":0,"accountNumber":"120221108090757","ifsc":"SABK00003112"},"9949168919":{"balance":0,"accountNumber":"120221108090821","ifsc":"SABK00003112"}}}
        """

        let decoder = JSONDecoder()
        let jdata = jstring.data(using: .utf8)
        do{
            let db = try decoder.decode(BankDB.self, from: jdata!)
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

