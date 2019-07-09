//
//  Level.swift
//  Resume
//
//  Created by Abdullah Tabassum on 2019-07-09.
//  Copyright © 2019 Abdullah Tabassum. All rights reserved.
//

import Foundation

enum Level {
    case junior
    case intermediate
    case senior
}

extension Level: Codable {
    enum Key: CodingKey {
        case rawValue
    }

    enum CodingError: Error {
        case unknownValue
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        let rawValue = try container.decode(Int.self, forKey: .rawValue)
        switch rawValue {
        case 0:
            self = .junior
        case 1:
            self = .intermediate
        case 2:
            self = .senior
        default:
            throw CodingError.unknownValue
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        switch self {
        case .junior:
            try container.encode(0, forKey: .rawValue)
        case .intermediate:
            try container.encode(1, forKey: .rawValue)
        case .senior:
            try container.encode(2, forKey: .rawValue)
        }
    }
}
