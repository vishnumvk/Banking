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
        {"userDB":{"8309914972":{"name":"sai","password":"2242","phonenumber":"8309914972"},"9949168919":{"name":"vishnu","password":"1234","phonenumber":"9949168919"}},"transactionDB":{"120221107112744":[{"amount":1000,"by":"tnxservices","tID":"TNX20221107112749","type":"credit","date":689513269.79052901},{"amount":100,"by":"tnxservices","tID":"TNX20221107112753","type":"credit","date":689513273.85206199},{"amount":120,"by":"tnxservices","tID":"TNX20221107112911","type":"debit","date":689513351.29195702}],"120221107111434":[{"amount":1000,"by":"tnxservices","tID":"TNX20221107111454","type":"credit","date":689512494.98350096},{"amount":100,"by":"tnxservices","tID":"TNX20221107112706","type":"debit","date":689513226.23118103}]},"accDB":{"8309914972":{"balance":980,"accountNumber":"120221107112744","IFSC":"SABK00003112"},"9949168919":{"balance":900,"accountNumber":"120221107111434","IFSC":"SABK00003112"}}}
        """

        let decoder = JSONDecoder()
        let jdata = jstring.data(using: .utf8)
        if let db = try? decoder.decode(BankDB.self, from: jdata!){
            return db
        }else{
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

