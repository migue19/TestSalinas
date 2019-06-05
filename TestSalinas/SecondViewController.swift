//
//  SecondViewController.swift
//  TestSalinas
//
//  Created by MacbookPro on 6/5/19.
//  Copyright © 2019 nut. All rights reserved.
//

import Foundation
import UIKit


protocol SecondProtocol {
    func sendInfo(num: Int)
}

class SecondViewController: UIViewController{
    var delegate : SecondProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hola mundo")
    }
    
    

    
    
    @IBAction func hola(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        delegate?.sendInfo(num: 5)
    }
}
