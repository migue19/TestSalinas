//
//  MainViewPresenter.swift
//  TestSalinas
//
//  Created by MacbookPro on 6/5/19.
//  Copyright © 2019 nut. All rights reserved.
//

import Foundation

class MainViewPresenter {
    weak var view: MainViewController?
    var provider: MainViewProvider?
    var wireframe: MainViewWireFrame?
    
    
    init() {
    }
}


extension MainViewPresenter: MainViewEventHandler{
   
}

extension MainViewPresenter: MainViewOutput{
    
  
    
}
