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
    func touchSendImage(name: String) {
        view?.showHUD()
        interactor?.sendImage(name: name)
    }
    func getData() {
        interactor?.fetchData()
    }
    func tapGraphicOption() {
        router?.showGraphic()
    }
}
extension HomePresenter: HomeInteractorOutputProtocol {
    func sendError(error: String) {
        view?.hideHUD()
        view?.showMessage(message: error, type: .error)
    }
    func sendRemoteConfig(config: RemoteConfig) {
        view?.updateRemoteConfig(config: config)
    }
    func sendPhoto(url: URL) {
        view?.hideHUD()
        view?.showPhoto(url: url)
    }
    func sendData(data: [DataHome]) {
        view?.showData(data: data)
    }
}
