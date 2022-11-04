//
//  main.swift
//  Banking
//
//  Created by vishnu-pt6278 on 18/10/22.
//

import Foundation

let jstring = """
{"userDB":{"9949168919":{"name":"sai","password":"2242","phonenumber":"9949168919"},"8309914972":{"name":"vishnu","password":"1234","phonenumber":"8309914972"}},"transactionDB":{"1312002":[{"amount":1000,"by":"tnxservices","tID":"TNX4","type":"debit","date":689256453.49306202},{"amount":10.550000000000001,"by":"tnxservices","tID":"TNX5","type":"credit","date":689256464.09456205},{"amount":250,"by":"tnxservices","tID":"TNX6","type":"debit","date":689256476.62361395}],"1312001":[{"amount":1000,"by":"tnxservices","tID":"TNX1","type":"debit","date":689256349.78690505},{"amount":1000,"by":"tnxservices","tID":"TNX2","type":"debit","date":689256356.59445405},{"amount":100,"by":"tnxservices","tID":"TNX3","type":"credit","date":689256387.87944901},{"amount":200,"by":"tnxservices","tID":"TNX7","type":"credit","date":689256640.25533402},{"amount":1000,"by":"tnxservices","tID":"TNX8","type":"debit","date":689256663.63208199}]},"accDB":{"9949168919":{"balance":2700,"accountNumber":"1312001","IFSC":"SABK001"},"8309914972":{"balance":1239.45,"accountNumber":"1312002","IFSC":"SABK002"}}}
"""

let decoder = JSONDecoder()
let jdata = jstring.data(using: .utf8)
BankDB.db = try! decoder.decode(BankDB.self, from: jdata!)

MainPage.load()

let encoder = JSONEncoder()
let data = try! encoder.encode(BankDB.db)
print(String(data: data, encoding: .utf8)!)
