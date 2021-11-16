//
//  BaseViewController.swift
//  TestSalinas
//
//  Created by MacbookPro on 6/5/19.
//  Copyright © 2019 nut. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    func setupView() {}
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    func hideKeyboardTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
