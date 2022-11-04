//
//  User.swift
//  Banking
//
//  Created by vishnu-pt6278 on 31/10/22.
//

import Foundation



class User: Codable{
    
    let name: String
    let phonenumber: String
    let password: String
    
    
    public init(name: String, phonenumber: String, password: String) {
        self.name = name
        self.phonenumber = phonenumber
        self.password = password
    }
}


extension User: Hashable
{
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(password)
        hasher.combine(phonenumber)
    }
    
    static func == (lhs:User,rhs:User) -> Bool
    {
        return lhs.hashValue == rhs.hashValue
    }
}

