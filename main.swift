//
//  main.swift
//  Banking
//
//  Created by vishnu-pt6278 on 18/10/22.
//

import Foundation


MainPage.load()

let encoder = JSONEncoder()
let data = try! encoder.encode(BankDB.shared)
print(String(data: data, encoding: .utf8)!)


