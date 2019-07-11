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
    var positions: [Position] {get set}
    var phone: String {get set}
    var address: String {get}
    var objective: String? {get set}
    var education: String? {get set}
    var language: [String]? {get set}

    func loadResume(reslistener: ResumeListener?)
}

typealias ResumeListener = (Resume) -> Void

class ResumeVM: ResumeViewModel{

    var resume: Resume?
    var modelManager: ModelManager

    init(manager: ModelManager) {
        modelManager = manager
    }

    func loadResume(reslistener: ResumeListener?) {
        // access the model manager to download resume
        modelManager.loadResume(completion: {[weak self] result in
            switch result {
            case .success(let lResume):
                print("This is the resume: \(lResume)")
                self?.resume = lResume
                reslistener?(lResume)
            case .failure(let error):
                print("error occured \(error)")
                self?.resume = nil
            }
        })
    }

    var name: String {
        get {
            return resume?.name ?? ""
        }
        set {
            resume?.name = newValue
        }
    }

    var positions: [Position] {
        get {
            return resume?.positions ?? []
        }
        set {
            resume?.positions = newValue
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

    var language: [String]? {
        get {
            return nil
        }
        set {
            resume?.language = newValue
        }
    }
}
