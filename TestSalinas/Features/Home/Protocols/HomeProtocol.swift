//
//  HomeProtocol.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import Foundation
import UIKit
/// Protocolo que define los métodos y atributos para el view de Home
protocol HomeViewProtocol: GeneralView {
    // PRESENTER -> VIEW
    func showData(data: [DataHome])
    func showPhoto(url: URL)
    func updateRemoteConfig(config: RemoteConfig)
}
/// Protocolo que define los métodos y atributos para el routing de Home
protocol HomeRouterProtocol {
    // PRESENTER -> ROUTING
    func showGraphic()
}
/// Protocolo que define los métodos y atributos para el Presenter de Home
protocol HomePresenterProtocol {
    // VIEW -> PRESENTER
    func tapGraphicOption()
    func getData()
    func touchSendImage(name: String)
}
/// Protocolo que define los métodos y atributos para el Interactor de Home
protocol HomeInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    func fetchData()
    func sendImage(name: String)
}
/// Protocolo que define los métodos y atributos para el Interactor de Home
protocol HomeInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    func sendData(data: [DataHome])
    func sendPhoto(url: URL)
    func sendRemoteConfig(config: RemoteConfig)
    func sendError(error: String)
}
protocol InputDataDelegate: AnyObject {
    func sendInputData(name: String)
}
