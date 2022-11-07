//
//  Bank.swift
//  Banking
//
//  Created by vishnu-pt6278 on 20/10/22.
//

import Foundation

extension Date{
    
    var numericString: String{
        get{
            var str = self.description
            str.removeAll {"-+: ".contains($0)}
            return String(str[...str.index(str.endIndex, offsetBy: -5)])
        }
    }
    
}


class BankUtils{
    
    
    static func newTnxId()->String{
        return "TNX" + Date().numericString
    }
    
    static func newSavingsAccNo()->String{
        
        return "1" + Date().numericString
    }
    static func ifsc()->String{
        
        return "SABK00003112"
    }
}
