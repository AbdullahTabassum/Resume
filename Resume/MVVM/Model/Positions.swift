//
//  Positions.swift
//  Resume
//
//  Created by Abdullah Tabassum on 2019-07-09.
//  Copyright © 2019 Abdullah Tabassum. All rights reserved.
//

import Foundation

struct Position: Codable {
    var level: Int
    var positionName: String
    var from: String
    var to: String?
    var description: String
}
