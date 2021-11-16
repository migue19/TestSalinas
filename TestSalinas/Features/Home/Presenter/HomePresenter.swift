//
//  HomePresenter.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import Foundation

class HomePresenter {
    var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var router: HomeRouterProtocol?
}
extension HomePresenter: HomePresenterProtocol {
    func getData() {
        interactor?.fetchData()
    }
    func tapGraphicOption() {
        router?.showGraphic()
    }
}
extension HomePresenter: HomeInteractorOutputProtocol {
    func sendData(data: [String]) {
        view?.showData(data: data)
    }
}
