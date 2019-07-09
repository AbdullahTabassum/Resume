//
//  Address.swift
//  Resume
//
//  Created by Abdullah Tabassum on 2019-07-09.
//  Copyright © 2019 Abdullah Tabassum. All rights reserved.
//

import Foundation

struct Address: Codable {
    var street: String
    var number: Int
    var city: String
    var province: String
    var country: String
}
