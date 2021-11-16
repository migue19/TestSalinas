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
protocol HomeViewProtocol {
    // PRESENTER -> VIEW
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
}
/// Protocolo que define los métodos y atributos para el Interactor de Home
protocol HomeInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
}
/// Protocolo que define los métodos y atributos para el Interactor de Home
protocol HomeInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
}
