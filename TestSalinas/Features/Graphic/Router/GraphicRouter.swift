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
    var view: GraphicVC
    private var presenter: GraphicPresenter
    private var interactor: GraphicInteractor
    init() {
        self.view = GraphicVC()
        self.presenter = GraphicPresenter()
        self.interactor = GraphicInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension GraphicRouter: GraphicRouterProtocol {
}
