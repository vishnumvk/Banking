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
        {"userDB":{"8309914972":{"name":"vishnu","password":"1234","phonenumber":"8309914972"},"9949168919":{"name":"sai","password":"2242","phonenumber":"9949168919"}},"transactionDB":{"120221108090757":[{"amount":2000,"by":"payment-from: sai","tID":"TNX20221108110033","type":"credit","date":689598033.11493802},{"amount":1549,"by":"self-tnxservices","tID":"TNX20221108110119","type":"credit","date":689598079.95072496},{"amount":1000,"by":"self-tnxservices","tID":"TNX20221108110125","type":"debit","date":689598085.76739299},{"amount":1000,"by":"transfer-To: sai","tID":"TNX20221108110136","type":"debit","date":689598096.34862304}],"120221108090821":[{"amount":5000,"by":"self-tnxservices","tID":"TNX20221108105947","type":"credit","date":689597987.12673104},{"amount":1000,"by":"self-tnxservices","tID":"TNX20221108105957","type":"debit","date":689597997.21536505},{"amount":2000,"by":"transfer-To: vishnu","tID":"TNX20221108110033","type":"debit","date":689598033.11490095},{"amount":1000,"by":"payment-from: vishnu","tID":"TNX20221108110136","type":"credit","date":689598096.34865701}]},"accDB":{"8309914972":{"balance":1549,"accountNumber":"120221108090757","ifsc":"SABK00003112"},"9949168919":{"balance":3000,"accountNumber":"120221108090821","ifsc":"SABK00003112"}}}
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

