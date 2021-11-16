//
//  GraphicPresenter.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import Foundation

class GraphicPresenter {
    var view: GraphicViewProtocol?
    var interactor: GraphicInteractorInputProtocol?
    var router: GraphicRouterProtocol?
}
extension GraphicPresenter: GraphicPresenterProtocol {
    func getData() {
        view?.showHUD()
        interactor?.fetchData()
    }
}
extension GraphicPresenter: GraphicInteractorOutputProtocol {
    func sendData(data: GraphicEntity) {
        view?.hideHUD()
        view?.showData(data: data)
    }
    func sendErrorMessage(message: String) {
    }
}
