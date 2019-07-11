//
//  ResumeViewModel.swift
//  Resume
//
//  Created by Abdullah Tabassum on 2019-07-09.
//  Copyright © 2019 Abdullah Tabassum. All rights reserved.
//

import Foundation

protocol ResumeViewModel {
    var name: String {get set}
    var positions: [PositionViewModel] {get}
    var phone: String {get set}
    var address: String {get}
    var objective: String? {get set}
    var education: String? {get set}
    var language: String? {get}

    func loadResume(reslistener: ResumeListener?)
    func configure(res: Resume)
}

typealias ResumeListener = (Resume) -> Void

class ResumeVM: ResumeViewModel{

    var resume: Resume?
    var modelManager: ModelManager?

    init(manager: ModelManager) {
        modelManager = manager
    }

    init(res: Resume) {
        resume = res
    }

    func loadResume(reslistener: ResumeListener?) {
        /// download resume
        modelManager?.loadResume(completion: {[weak self] result in
            switch result {
            case .success(let lResume):
                self?.resume = lResume
                reslistener?(lResume)
            case .failure(let error):
                print("error occured \(error)")
                self?.resume = nil
            }
        })
    }

    func configure(res: Resume) {
        resume = res
    }

    var name: String {
        get {
            return resume?.name ?? ""
        }
        set {
            resume?.name = newValue
        }
    }

    var positions: [PositionViewModel] {
        get {
            guard let posVMs = resume?.positions else {
                return []
            }
            return posVMs.map{PositionViewModelImpl(pos: $0)}
        }
    }

    var phone: String {
        get {
            return resume?.phone ?? ""
        }
        set {
            resume?.phone = newValue
        }
    }

    var address: String {
        get {
            if let res =  resume {
                return String(res.address.number) + " - " + res.address.street + " - " + res.address.city + " - " + res.address.country
            }
            return ""
        }
    }

    var objective: String? {
        get {
            return resume?.objective ?? ""
        }
        set {
            resume?.objective = newValue
        }
    }

    var education: String? {
        get {
            return resume?.objective ?? ""
        }
        set {
            resume?.education = newValue
        }
    }

    var language: String? {
        get {
            return resume?.language?.joined(separator: ", ")
        }
    }
}
