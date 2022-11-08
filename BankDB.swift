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
    
    var transactionDB : [String : [Transaction]]=[:]
    var userDB: [String  : User] = [:]
    var accDB: [String : SavingsAccount] = [:]
    
    
    private static func loadSampleData()->BankDB{
        let jstring = """
        {"userDB":{"8309914972":{"name":"vishnu","password":"1234","phonenumber":"8309914972"},"9949168919":{"name":"sai","password":"2242","phonenumber":"9949168919"}},"transactionDB":{"120221108090757":[{"amount":1000,"by":"tnxservices","tID":"TNX20221108090837","type":"credit","date":689591317.70038199},{"amount":100,"by":"tnxservices","tID":"TNX20221108090847","type":"debit","date":689591327.84489202},{"amount":1000,"by":"tnxservices","tID":"TNX20221108090938","type":"credit","date":689591378.44259799},{"amount":1000,"by":"tnxservices","tID":"TNX20221108090943","type":"debit","date":689591383.65290296},{"amount":2000,"by":"tnxservices","tID":"TNX20221108091022","type":"credit","date":689591422.84041405},{"amount":1000,"by":"tnxservices","tID":"TNX20221108091034","type":"debit","date":689591434.68696702}],"120221108090821":[{"amount":100,"by":"tnxservices","tID":"TNX20221108090847","type":"credit","date":689591327.84492803},{"amount":1000,"by":"tnxservices","tID":"TNX20221108091034","type":"credit","date":689591434.68699896},{"amount":100,"by":"tnxservices","tID":"TNX20221108091105","type":"credit","date":689591465.30043006},{"amount":25,"by":"tnxservices","tID":"TNX20221108091108","type":"debit","date":689591468.88522303}]},"accDB":{"8309914972":{"balance":1900,"accountNumber":"120221108090757","ifsc":"SABK00003112"},"9949168919":{"balance":1175,"accountNumber":"120221108090821","ifsc":"SABK00003112"}}}
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

