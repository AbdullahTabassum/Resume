//
//  ModelManager.swift
//  Resume
//
//  Created by Abdullah Tabassum on 2019-07-09.
//  Copyright © 2019 Abdullah Tabassum. All rights reserved.
//

import Foundation

typealias LoadResumeCompletion = (LoadingResult<Resume>) -> Void

protocol ModelManager {
    func loadResume(completion: @escaping LoadResumeCompletion)
}

struct ModelManagerImpl: ModelManager {

    init() {

    }
    func loadResume(completion: LoadResumeCompletion) {

    }
}
