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

    var resViewModel: ResumeViewModel?

    struct AccessilibityIdentifiers {
        static let nameTitle = "nameTitle"
        static let objective = "objective"
        static let objectiveTitle = "objectiveTitle"
        static let phoneNumber = "phoneNumber"
        static let contactInfo = "contactInfo"
        static let address = "address"
        static let experience = "experience"
        static let languageTitle = "languageTitle"
        static let language = "language"
    }

    ///ui subviews
    var nameTitle: UILabel = {
        let label = UILabel()
        label.text = "Abdullah Tabassum"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.accessibilityIdentifier = AccessilibityIdentifiers.nameTitle
        return label
    }()

    var objective: UILabel = {
        let label = UILabel()
        label.text = "I wish to secure a progressive and filfilling career"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.accessibilityIdentifier = AccessilibityIdentifiers.objective
        return label
    }()

    var objectiveTitle: UILabel = {
        let label = UILabel()
        label.text = "Objective"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.accessibilityIdentifier = AccessilibityIdentifiers.objectiveTitle
        return label
    }()

    var phoneNumber: UILabel = {
        let label = UILabel()
        label.text = "999-999-9999"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.accessibilityIdentifier = AccessilibityIdentifiers.phoneNumber
        return label
    }()

    var contactInfo: UILabel = {
        let label = UILabel()
        label.text = "Contact Information"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.accessibilityIdentifier = AccessilibityIdentifiers.contactInfo
        return label
    }()


    let address: UILabel = {
        let label = UILabel()
        label.text = "3384 Aubrey rd"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.accessibilityIdentifier = AccessilibityIdentifiers.address
        return label
    }()

    var experience: UILabel = {
        let label = UILabel()
        label.text = "Experience"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.accessibilityIdentifier = AccessilibityIdentifiers.experience
        return label
    }()

    var languagesTitle: UILabel = {
        let label = UILabel()
        label.text = "Languages"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.accessibilityIdentifier = AccessilibityIdentifiers.languageTitle
        return label
    }()

    var languages: UILabel = {
        let label = UILabel()
        label.text = "English"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.accessibilityIdentifier = AccessilibityIdentifiers.language
        return label
    }()

    let scrollView : UIScrollView = {
        let sView = UIScrollView()
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.backgroundColor = UIColor.white
        return sView
    }()

    lazy var positions: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PositionCellView.self, forCellReuseIdentifier: PositionCellView.identifier)
        tableView.dataSource = self
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setupViews()

        self.styleView()
    }

    func configure(resVM: ResumeViewModel) {
        resViewModel = resVM
        positions.reloadData()

        nameTitle.text = resViewModel?.name
        objective.text = resViewModel?.objective
        phoneNumber.text = resViewModel?.phone
        address.text = resViewModel?.address
        languages.text = resViewModel?.language
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        self.addSubview(scrollView)
        scrollView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true

        ///name title
        self.addSubview(nameTitle)
        nameTitle.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        nameTitle.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true

        /// contact info title
        self.addSubview(contactInfo)
        contactInfo.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 15.0).isActive = true
        contactInfo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5.0).isActive = true

        /// phone number
        self.addSubview(phoneNumber)
        phoneNumber.topAnchor.constraint(equalTo: contactInfo.bottomAnchor, constant: 5.0).isActive = true
        phoneNumber.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10.0).isActive = true

        /// address
        self.addSubview(address)
        address.topAnchor.constraint(equalTo: phoneNumber.bottomAnchor, constant: 5.0).isActive = true
        address.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10.0).isActive = true

        /// Objective
        self.addSubview(objectiveTitle)
        objectiveTitle.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 15.0).isActive = true
        objectiveTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5.0).isActive = true
        self.addSubview(objective)
        objective.topAnchor.constraint(equalTo: objectiveTitle.bottomAnchor, constant: 5.0).isActive = true
        objective.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10.0).isActive = true
        objective.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10.0).isActive = true

        /// languages
        self.addSubview(languagesTitle)
        languagesTitle.topAnchor.constraint(equalTo: objective.bottomAnchor, constant: 5.0).isActive = true
        languagesTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5.0).isActive = true
        self.addSubview(languages)
        languages.topAnchor.constraint(equalTo: languagesTitle.bottomAnchor, constant: 5.0).isActive = true
        languages.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10.0).isActive = true
        languages.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10.0).isActive = true

        /// experience
        self.addSubview(experience)
        experience.topAnchor.constraint(equalTo: languages.bottomAnchor, constant: 15.0).isActive = true
        experience.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5.0).isActive = true

        /// tableView setup
        self.addSubview(positions)
        positions.topAnchor.constraint(equalTo: experience.bottomAnchor, constant: 10.0).isActive = true
        positions.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        positions.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        positions.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }

    private func styleView() {
        self.backgroundColor = .white
    }
}

/// TODO: this logic should be moved to another class
extension ResumeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {        
        return resViewModel?.positions.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let positionViewModel = resViewModel?.positions[indexPath.row]

        if let cell: PositionCellView = tableView.dequeueReusableCell(withIdentifier: PositionCellView.identifier, for: indexPath) as? PositionCellView{
            cell.positionDescription.text = positionViewModel?.positionDescription
            cell.positionName.text = positionViewModel?.positionName
            return cell
        }

        return UITableViewCell()
    }


}
