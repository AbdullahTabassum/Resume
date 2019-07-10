//
//  Parser.swift
//  Resume
//
//  Created by Abdullah Tabassum on 2019-07-09.
//  Copyright © 2019 Abdullah Tabassum. All rights reserved.
//

import Foundation

protocol Parser {
    func decode<T: Decodable>(type: T.Type, from: Data?) -> T?
}

struct ParserImpl: Parser {
    func decode<T: Decodable>(type: T.Type, from: Data?) -> T? {
        guard let data = from else {return nil}

        let decoder = JSONDecoder()

        guard let parsedData = try? decoder.decode(type, from: data) else {return nil}

        return parsedData
    }
}
