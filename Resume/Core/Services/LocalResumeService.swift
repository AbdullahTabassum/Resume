//
//  LocalResumeService.swift
//  Resume
//
//  Created by Abdullah Tabassum on 2019-07-10.
//  Copyright © 2019 Abdullah Tabassum. All rights reserved.
//

import Foundation
class LocalResumeService: ResumeService{

    var lParser: Parser
    init(parser: Parser) {
        lParser = parser
    }

    func loadResume(completion : @escaping LoadResumeCompletion) {
        if let path = Bundle.main.path(forResource: "resume", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                if let resume = lParser.decode(type: Resume.self, from: data) {
                    completion(LoadingResult.success(resume))
                } else {
                    completion(LoadingResult.failure(ResumeError.malformedResponse))
                }
            } catch {
                // handle error
                completion(LoadingResult.failure(ResumeError.malformedResponse))
            }
        }
    }

}
