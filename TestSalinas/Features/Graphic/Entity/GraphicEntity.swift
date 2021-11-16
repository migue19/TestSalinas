//
//  GraphicEntity.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import Foundation

struct GraphicEntity: Codable {
    var colors: [String]
    var questions: [QuestionEntity]
}
struct QuestionEntity: Codable {
    var total: Int
    var text: String
    var chartData: [ChartEntity]
}
struct ChartEntity: Codable {
    var text: String
    var percetnage: Int
}
