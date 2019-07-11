//
//  ResumeView.swift
//  Resume
//
//  Created by Abdullah Tabassum on 2019-07-10.
//  Copyright © 2019 Abdullah Tabassum. All rights reserved.
//

import Foundation
import UIKit

class ResumeView: UIView {

    ///ui subviews instantiated lazily
    let nameTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let objective: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    let objectiveTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let phoneNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    let address: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let scrollView : UIScrollView = {
        let sView = UIScrollView()
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.backgroundColor = UIColor.red
        return sView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setupViews()

        self.styleView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        self.addSubview(scrollView)
        scrollView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true


    }

    private func styleView() {
        self.backgroundColor = .red
    }
}
