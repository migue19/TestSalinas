//
//  ActionTableViewCell.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import UIKit

class ActionTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    static let identifier = String(describing: ActionTableViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupCell(text: String, align: NSTextAlignment) {
        nameLabel.text = text
        nameLabel.textAlignment = align
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
