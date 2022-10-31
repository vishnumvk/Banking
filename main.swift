//
//  main.swift
//  Banking
//
//  Created by vishnu-pt6278 on 18/10/22.
//

import Foundation

let user1 = User(name: "vishnu", phonenumber: "8309914972", password: "mvk@")


func createUserAcc()-> User?{
    let name = InputManager.readValid(promtMsg: "Enter valid name",validateBy: { name in
        
        guard name.trimmingCharacters(in: .whitespacesAndNewlines) != ""
        else{
            return false
        }
        let nameCharSet = CharacterSet(charactersIn: name)
        
        if(name.count >= 3 && name.count < 25 && nameCharSet.isSubset(of: .letters.union(.whitespaces))){
            return true
        }
        else{
            return false
        }
        
        
        
        
        
        
    })
    
    let ph = InputManager.readValid(promtMsg: "Enter valid Phone number", validateBy: InputManager.validatePhUsingRegex)
    
    let password = InputManager.readValid(promtMsg: "Enter valid four digit pin ",validateBy: { pin in
        let pinCharSet = CharacterSet(charactersIn: pin)
        
        if(pin.count == 4 && pinCharSet.isSubset(of: CharacterSet(charactersIn: "0123456789"))){
            return true
        }
        else{
            return false
        }
        
    })
    
    return User(name: name.trimmingCharacters(in: .whitespacesAndNewlines), phonenumber: ph, password: password)
}

print(createUserAcc()!.name + "---")
