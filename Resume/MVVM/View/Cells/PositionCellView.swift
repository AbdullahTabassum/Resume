//
//  PositionCellView.swift
//  Resume
//
//  Created by Abdullah Tabassum on 2019-07-11.
//  Copyright © 2019 Abdullah Tabassum. All rights reserved.
//

import Foundation
import UIKit

class PositionCellView: UITableViewCell {
    static let identifier: String = "PositionCellView"
    var positionName: UILabel = {
        let label = UILabel()
        label.text = "Position Name"
        label.font = UIFont.boldSystemFont(ofSize: 13.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        return label
    }()

    var positionDescription: UILabel = {
        let label = UILabel()
        label.text = "this is a generic description of a job that i had"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        applyConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    private func applyConstraints() {
        self.contentView.addSubview(positionName)
        positionName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5.0).isActive = true
        positionName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10.0).isActive = true

        self.contentView.addSubview(positionDescription)
        positionDescription.topAnchor.constraint(equalTo: positionName.bottomAnchor, constant: 10.0).isActive = true
        positionDescription.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10.0).isActive = true
        positionDescription.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5.0).isActive = true
    }
}
