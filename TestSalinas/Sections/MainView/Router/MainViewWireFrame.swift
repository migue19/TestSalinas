//
//  MainViewWireFrame.swift
//  TestSalinas
//
//  Created by MacbookPro on 6/5/19.
//  Copyright © 2019 nut. All rights reserved.
//

import Foundation
import UIKit

class MainViewWireFrame{
    private var view: MainViewController?
    private var presenter: MainViewPresenter?
    private var interactor: MainViewInteractor?
    private var navigation: UINavigationController?
    private var window: UIWindow?
    
    
    
    init(in window: UIWindow?) {
        view = MainViewController()
        presenter = MainViewPresenter()
        interactor = MainViewInteractor()
        
        view?.eventHandler = self.presenter
        presenter?.view = self.view
        presenter?.provider = self.interactor
        interactor?.output = presenter
        presenter?.wireframe = self
        
        self.window = window
    }
    
    
}


extension MainViewWireFrame{
    func showMainView() {
        window?.rootViewController = view
            //UINavigationController(rootViewController: view!)
        window?.makeKeyAndVisible()
    }
}
