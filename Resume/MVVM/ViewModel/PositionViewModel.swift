//
//  PositionViewModel.swift
//  Resume
//
//  Created by Abdullah Tabassum on 2019-07-11.
//  Copyright © 2019 Abdullah Tabassum. All rights reserved.
//

import Foundation
protocol PositionViewModel {
    var positionName: String {get set}
    var positionDescription: String {get set}
}

struct PositionViewModelImpl: PositionViewModel {
    var position: Position

    init(pos: Position) {
        self.position = pos
    }

    var positionName: String {
        get {
            return position.positionName
        }
        set {
            position.positionName = newValue
        }
    }

    var positionDescription: String {
        get {
            return position.description
        }
        set {
            position.description = newValue
        }
    }
}
