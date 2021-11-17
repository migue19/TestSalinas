//
//  HomeEntity.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 17/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import Foundation
import UIKit

struct DataHome {
    var description: String?
    var sizeCell: Double?

    func getData() -> [DataHome] {
        let data: [DataHome] = [
            DataHome(description: "Input", sizeCell: 60),
            DataHome(description: "Tomar Selfie", sizeCell: 70),
            DataHome(description: "home_description_graph".localized, sizeCell: 400)
        ]
        return data
    }
}

struct RemoteConfig {
    var color: UIColor
}
