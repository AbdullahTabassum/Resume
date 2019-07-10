//
//  ResumeService.swift
//  Resume
//
//  Created by Abdullah Tabassum on 2019-07-09.
//  Copyright © 2019 Abdullah Tabassum. All rights reserved.
//

import Foundation

enum LoadingResult<T> {
    case success(T)
    case failure(Error)
}

enum ResumeError: Error {
    case malformedURL
    case downloadFailure(message: String)
    case malformedResponse
    case unknownError
}

protocol ResumeService {
    func downloadResume(completion : @escaping LoadResumeCompletion)
}

class ResumeServiceImpl: ResumeService {
    var resumeParser: Parser

    init(parser: Parser) {
        self.resumeParser = parser
    }

    func downloadResume(completion: @escaping LoadResumeCompletion) {
        guard let url: URL = URL(string: Endpoints.Git.resume) else {
            completion(LoadingResult.failure(ResumeError.malformedURL))
            return
        }

        //make the call using url session
        let session = URLSession.shared.dataTask(with: url) { [weak self] data, httpResponse, error in
            guard let strongSelf = self else {
                completion(LoadingResult.failure(ResumeError.unknownError))
                return
            }
            //check for errors, including empty data
            guard let data = data, error == nil else {
                completion(LoadingResult.failure(ResumeError.downloadFailure(message: error.debugDescription)))
                return
            }

            guard let resume = strongSelf.resumeParser.decode(type: Resume.self, from: data) else {
                completion(LoadingResult.failure(ResumeError.malformedResponse))
                return
            }
            completion(LoadingResult.success(resume))
        }

        session.resume()
    }
}
