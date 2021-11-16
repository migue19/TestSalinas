//
//  DescriptionTableViewCell.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    @IBOutlet weak var textView: UITextView!
    static let identifier = String(describing: DescriptionTableViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupCell(text: String, align: NSTextAlignment) {
        textView.textAlignment = align
        textView.text = text
        textView.isEditable = false
        textView.isSelectable = false
    }
}
