//
//  Coordinator.swift
//  Resume
//
//  Created by Abdullah Tabassum on 2019-07-10.
//  Copyright © 2019 Abdullah Tabassum. All rights reserved.
//

import Foundation
import UIKit

///used to inject dependencies for the Resume screen
protocol ResumeCoordinator {
    func start(window: UIWindow)
}

struct ResumeCoordinatorImpl: ResumeCoordinator {

    /// creates dependency list
    func start(window: UIWindow) {
        /// screen
        let screen = UIScreen().bounds

        /// parser
        let parser = ParserImpl()

        /// service - can use local for testing with stubs, been having trouble with gist.github connectivity
        let service: ResumeService = LocalResumeService(parser: parser)

        /// model manager
        let modelManager = ModelManagerImpl(service: service)

        /// view model
        let viewModel: ResumeViewModel = ResumeVM(manager: modelManager)

        /// view
        let resumeView: ResumeView = ResumeView(frame: CGRect(x: 0, y: 0, width: screen.width, height: screen.height))

        let resumeViewController = ResumeViewController(viewModel: viewModel, view: resumeView)
        window.rootViewController = resumeViewController
    }

}
