//
//  ViewController.swift
//  TestSalinas
//
//  Created by MacbookPro on 6/5/19.
//  Copyright © 2019 nut. All rights reserved.
//

import UIKit

class ViewController: UIViewController,SecondProtocol {
    func sendInfo(num: Int) {
        print("presionaste \(num)")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "Hola"){
            let vc = segue.destination as! SecondViewController
            vc.delegate = self
        }
    }

}

