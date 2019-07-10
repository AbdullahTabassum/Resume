//
//  ViewController.swift
//  Resume
//
//  Created by Abdullah Tabassum on 2019-07-09.
//  Copyright © 2019 Abdullah Tabassum. All rights reserved.
//

import UIKit

class ResumeViewController: UIViewController {
    let service = LocalResumeService(parser: ParserImpl())

    override func viewDidLoad() {
        super.viewDidLoad()

        service.loadResume(completion: {result in
            switch result {
            case .success(let resume):
                print("This is the resume: \(resume)")
            case .failure(let error):
                print("error occured \(error)")
            }
        })
    }


}

