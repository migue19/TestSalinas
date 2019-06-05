//
//  MainViewController.swift
//  TestSalinas
//
//  Created by MacbookPro on 6/5/19.
//  Copyright © 2019 nut. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    var eventHandler: MainViewEventHandler?
    var scrollView: UIScrollView?
    var contentView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func createView() {
        self.view.backgroundColor = UIColor.white
        scrollView = UIScrollView()
        scrollView?.contentSize = CGSize(width: view.frame.width, height: 960)
        scrollView?.backgroundColor = .clear
        
        contentView = UIView(frame: CGRect(x: 0, y: 0, width: scrollView?.contentSize.width ?? 0, height: scrollView?.contentSize.height ?? 0))
        contentView?.backgroundColor = .clear
        
        
        
        labelConfigureYourNetworks = UILabel.getCustomLabel(text: "Configura tus redes", alignment: .center, fontName: .light, size: 23, color: .BLACK_COLOR)
        
        label24NetworkTitle = UILabel.getCustomLabel(text: "Infinitum 2.4", alignment: .left, fontName: .regular, size: 16, color: .BLUE_COLOR)
        
        label24NetworkName = UILabel.getCustomLabel(text: "Nombre de tu red (SSID)", alignment: .left, fontName: .regular, size: 14, color: .BLACK_COLOR)
        
        textField24NetworkName = UITextField()
        textField24NetworkName.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 5))
        textField24NetworkName.leftViewMode = .always
        textField24NetworkName.placeholder = "Nombre Red 2.4 GHz"
        textField24NetworkName.textColor = .TITLE_GRAY_COLOR
        textField24NetworkName.layer.borderColor = UIColor.LIGTH_GRAY_COLOR.cgColor
        textField24NetworkName.layer.borderWidth = 1
        textField24NetworkName.layer.cornerRadius = 5
        textField24NetworkName.delegate = self

    }
    
    
    override func addViews() {
        view.addSubview(scrollView!)
        scrollView?.addSubview(contentView!)
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
