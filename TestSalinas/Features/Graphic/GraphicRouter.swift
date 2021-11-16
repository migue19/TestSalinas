//
//  GraphicRouter.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import Foundation
import UIKit

class GraphicRouter {
    private var view: GraphicVC
    private var presenter: GraphicPresenter
    private var interactor: GraphicInteractor
    private var window: UIWindow?
    init(in window: UIWindow?) {
        self.view = GraphicVC()
        self.presenter = GraphicPresenter()
        self.interactor = GraphicInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
        self.window = window
    }
    func showView() {
        window?.rootViewController = UINavigationController(rootViewController: view)
        window?.makeKeyAndVisible()
    }
}
extension GraphicRouter: GraphicRouterProtocol {
}
