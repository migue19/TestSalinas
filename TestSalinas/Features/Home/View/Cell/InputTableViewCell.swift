//
//  InputTableViewCell.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import UIKit

class InputTableViewCell: UITableViewCell {
    @IBOutlet weak var nameTextField: UITextField!
    static let identifier = String(describing: InputTableViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension InputTableViewCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: RegularExpression.charactersAndSpace, options: [])
            if regex.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.count)) != nil {
                return false
            }
        } catch {
            print("ERROR")
        }
        return true
    }
}
