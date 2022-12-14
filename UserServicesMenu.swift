//
//  UserServices.swift
//  Banking
//
//  Created by vishnu-pt6278 on 01/11/22.
//

import Foundation

protocol UserServicesDB: TransactionsDB,UserDB{
    
    func getSavingsAccount(userID: String)->SavingsAccount?
    func userName(userID: String)->String

}

enum Options: Int{
    case exit = 0,deposit,withdraw,transfer,transactions,balanceCheck
}

class UserServicesMenu{
    
     init(db: UserServicesDB, user: User) {
        self.db = db
        self.user = user
    }
    
    let db: UserServicesDB
    let user: User
        
    func load(){
        
        let acc = db.getSavingsAccount(userID: user.phonenumber)!
        let accServices = TransactionServices(db: BankDB.shared)
        var hitexit = false
        
        repeat{
            
            print("""
                  1 --- deposit
                  2 --- withdraw
                  3 --- transfer
                  4 --- view transactions
                  5 --- balance check
                  0 --- Exit
                  """)
            let choice = InputManager.readValidInt()
            switch Options(rawValue: choice){
                
            case .deposit:
                let amount = InputManager.readValidAmount()
                let tnx = accServices.deposit(acc, amount: amount)
                print("""
                      \(tnx.description)
                      "New Balance: \(acc.balance)"
                      """)
                
            case .withdraw:
                
                let amount = InputManager.readValidAmount()
                do{
                   let tnx = try accServices.withdraw(acc, amount: amount)
                    print("""
                          \(tnx.description)
                          "New Balance: \(acc.balance)"
                          """)
                }catch{
                    switch error{
                    case TransactionErrors.insufficientFunds:
                        print("Insufficient Balance !")
                        print("AccNo: \(acc.accountNumber)   Available Balance: \(acc.balance)")
                    default:
                        print("Transaction Error !")
                    }
                }
                
                
            case .transfer:
                
                do{
                    let beneficiaryId = InputManager.readValid(promtMsg: "Enter registered beneficiary's phone number :", validateBy: InputManager.validatePhUsingRegex)
                    
                    guard beneficiaryId != user.phonenumber else{
                        throw TransactionErrors.cannotTransferToSelf
                    }
                    
                    guard let beneficiaryAccount = db.getSavingsAccount(userID: beneficiaryId)else{
                        throw TransactionErrors.beneficiaryNotFound
                    }
                    
                    let beneficiaryName = db.userName(userID: beneficiaryId)
                    let amount = InputManager.readValidAmount()
                    let tnx = try accServices.transfer(from: acc, to: beneficiaryAccount, amount: amount, senderName: user.name, beneficiaryName: beneficiaryName)
                    
                    print("""
                          \(tnx.description)
                          "New Balance: \(acc.balance)"
                          """)
                    
                }catch{
                    switch error{
                    case TransactionErrors.beneficiaryNotFound:
                        print("beneficiary not found..!")
                    case TransactionErrors.cannotTransferToSelf:
                        print("Cannot transfer money to self..!")
                    case TransactionErrors.insufficientFunds:
                        print("Insufficient Balance !")
                        print("AccNo: \(acc.accountNumber)   Available Balance: \(acc.balance)")
                        
                    default:
                        print("error in transfering money..!")
                    }
                }
                
                
            case .transactions:
                
                print("AccNo: \(acc.accountNumber)   Closing Balance: \(acc.balance)")
                
                if let tnxs = db.getTransactionsOf(accNo: acc.accountNumber){
                    for tnx in tnxs.reversed(){
                        print(tnx.description)
                    }
                }
               else{
                    print("no transactions..")
                }
                
            case .balanceCheck:
                print("AccNo: \(acc.accountNumber)   Balance: \(acc.balance)")
            
            case .exit:
                hitexit = true
                
            default :
                print("Enter a valid choice..")
            }
        }
        while(!hitexit)
        
        
        
        
        
        
        
    }
}
