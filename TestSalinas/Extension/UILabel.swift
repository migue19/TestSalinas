//
//  UILabel.swift
//  TestSalinas
//
//  Created by MacbookPro on 6/5/19.
//  Copyright © 2019 nut. All rights reserved.
//

import Foundation
import UIKit


extension UILabel {
    public static func getCustomLabel(text: String, alignment: NSTextAlignment, fontName: RobotoFontEnum, size: CGFloat, color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = alignment
        label.font = UIFont.init(name: fontName.rawValue, size: size)
        label.textColor = color
        label.numberOfLines = 0
        return label
    }
}
