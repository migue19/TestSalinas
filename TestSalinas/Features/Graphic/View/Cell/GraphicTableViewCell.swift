//
//  GraphicTableViewCell.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import UIKit
import Charts
class GraphicTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pieChartView: PieChartView!
    static let identifier = String(describing: GraphicTableViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setupCell(question: QuestionEntity, colors: [String]) {
        titleLabel.text = question.text
        customizeChart(data: question.chartData, colors: colors)
        print(question)
    }
    
    func customizeChart(data: [ChartEntity], colors: [String]) {
        //, data: $0.text as AnyObject
        let dataEntry = data.map({PieChartDataEntry(value: Double($0.percetnage), label: $0.text)})
        let pieChartDataSet = PieChartDataSet(entries: dataEntry, label: nil)
        let aux = colors[0..<dataEntry.count]
        pieChartDataSet.colors = colorsOfCharts(colors: Array(aux))
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
        pieChartView.data = pieChartData
    }
    private func colorsOfCharts(colors: [String]) -> [UIColor] {
        let newColors = colors.map( { UIColor(hexString: $0) } )
        return newColors
    }
}
