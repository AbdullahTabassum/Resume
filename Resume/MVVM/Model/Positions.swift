//
//  Positions.swift
//  Resume
//
//  Created by Abdullah Tabassum on 2019-07-09.
//  Copyright © 2019 Abdullah Tabassum. All rights reserved.
//

import Foundation

struct Position: Codable {
    var level: Level
    var positionName: String
    var from: Date
    var to: Date?
    var description: String
}
