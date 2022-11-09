//
//  main.swift
//  Banking
//
//  Created by vishnu-pt6278 on 18/10/22.
//

import Foundation




MainPage.load()

do{
    let encoder = JSONEncoder()
    let data = try encoder.encode(BankDB.shared)
    try data.write(to: BankDB.dataBaseFileUrl)
}
catch{
    switch error{
    default :
        print(error)
    }
}




