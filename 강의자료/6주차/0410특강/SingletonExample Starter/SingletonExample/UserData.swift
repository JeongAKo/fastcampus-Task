//
//  UserData.swift
//  SingletonExample
//
//  Created by Daisy on 10/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class userData {
    static let singleton = userData()
    var name = ""
    var passWord = ""
    var age = ""
    var phoneNumber = ""
    
    private init() {}
}


