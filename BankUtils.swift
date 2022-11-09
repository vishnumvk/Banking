//
//  Bank.swift
//  Banking
//
//  Created by vishnu-pt6278 on 20/10/22.
//

import Foundation

//extension Date{
//
//    var numericString: String{
//        get{
//            var str = self.description
//            str.removeAll {"-+: ".contains($0)}
//            return String(str[...str.index(str.endIndex, offsetBy: -5)])
//        }
//    }
//
//}


class BankUtils{
    
    private static func idGenerator()->String{
        
        var val = String(Date().timeIntervalSinceReferenceDate)
        val.remove(at: val.index(val.startIndex, offsetBy: 9)) //removes floating point.
        return val
    }
    
    static func newTnxId()->String{
        return "TNX" + idGenerator()
    }
    
    static func newSavingsAccNo()->String{
        
        return "1" + idGenerator()
    }
    static func ifsc()->String{
        
        return "SABK00003112"
    }
}
