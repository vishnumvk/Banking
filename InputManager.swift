//
//  InputManager.swift
//  Banking
//
//  Created by vishnu-pt6278 on 31/10/22.
//

import Foundation

public struct InputManager{
    enum InputErrors : Error{
        case InvalidNumber
        case InvalidPhoneNumber
    }
    public static func readValidInt()->Int{
        var x: Int?
        var isSuccess : Bool = false
        repeat{
            
            do{
                x = Int(readLine() ?? "nil")
                guard x != nil else{
                    throw InputErrors.InvalidNumber
                }
                isSuccess = true
            }
            catch {
                print("Enter a valid number..!")
                isSuccess = false
            }
            
        }while(!isSuccess)
        return x!;
    }
    
    
    public static func readValidPhoneNumber()->String{
        var ph : String
        var isValid : Bool = false
        repeat{
            
            do{
                ph = readLine()!
                guard ph.count == 10 else{
                    throw InputErrors.InvalidPhoneNumber
                }
                let set = CharacterSet(charactersIn: ph)
                if(set.isSubset(of: CharacterSet(charactersIn: "0123456789"))){
                    isValid = true
                }
                else{
                    throw InputErrors.InvalidPhoneNumber
                }
                
            }
            catch {
                print("Enter a valid Phonenumber..!")
                isValid = false
            }
            
        }while(!isValid)
        return ph;
    }
    
    
    
    
    
    
    
    
    
    
    
    public static func readValidPhoneNumber(readFrom : (Bool)->String? = readLine,validateBy : (String)->Bool = validatePhUsingRegex, errorMsg : String? = nil)->String{
        let isnotValid : Bool = true
        repeat{
            if let ph = readFrom(true){
                if(validateBy(ph)){
                    return ph
                }
                else{
                    if let msg = errorMsg{
                        print(msg)
                    }
                }
            }
            
        }while(isnotValid)
        
    }
    
    
    
    
    
    
    
    public static func readValid(promtMsg : String? = nil,validateBy: (String)->Bool)->String{
        let isnotValid : Bool = true
        repeat{
            if let msg = promtMsg{
                print(msg)
            }
            if let ph = readLine(){
                if(validateBy(ph)){
                    return ph
                }
            }
            
        }while(isnotValid)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    public static func validatePhUsingRegex(ph : String)->Bool{
        
        let result = ph.range(
            of: "^[0-9]{10}$",
            options: .regularExpression
        )

        
        
        return result != nil ? true : false
    }

    
}

