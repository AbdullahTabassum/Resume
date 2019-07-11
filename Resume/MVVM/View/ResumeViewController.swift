//
//  ViewController.swift
//  Resume
//
//  Created by Abdullah Tabassum on 2019-07-09.
//  Copyright © 2019 Abdullah Tabassum. All rights reserved.
//

import UIKit

class ResumeViewController: UIViewController {

    /// these should not be optional
    var resViewModel: ResumeViewModel
    var resumeView: ResumeView

    init(viewModel: ResumeViewModel, view: ResumeView) {
        resViewModel = viewModel
        resumeView = view
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    override func loadView() {
        self.view = resumeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        /// trigger the view model to load the resume
        resViewModel.loadResume{ resume in
            print("This is the resume: \(resume)")
        }
    }
}

