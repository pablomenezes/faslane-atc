//
//  user.swift
//  fastlane
//
//  Created by Fernando Ribeiro on 4/16/16.
//  Copyright © 2016 poisonlabs. All rights reserved.
//

import UIKit

class User: NSObject {

    internal class func validatesUserLogin(email: String!, password: String!) -> Bool {
        
        if email == "ferbass@gmail.com" && password == "123mudar" {
            return true
        }
        
        return false
    }
}
