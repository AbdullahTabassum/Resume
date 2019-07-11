//
//  Resume.swift
//  Resume
//
//  Created by Abdullah Tabassum on 2019-07-09.
//  Copyright © 2019 Abdullah Tabassum. All rights reserved.
//

import Foundation

struct Resume: Codable {
    var name: String
    var positions: [Position]
    var phone: String
    var address: Address
    var objective: String?
    var education: String?
    var language: [String]?
}
