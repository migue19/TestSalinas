//
//  GraphicProtocol.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import Foundation
import UIKit
/// Protocolo que define los métodos y atributos para el view de Graphic
protocol GraphicViewProtocol: GeneralView {
    // PRESENTER -> VIEW
    func showData(data: GraphicEntity)
}
/// Protocolo que define los métodos y atributos para el routing de Graphic
protocol GraphicRouterProtocol {
    // PRESENTER -> ROUTING
}
/// Protocolo que define los métodos y atributos para el Presenter de Graphic
protocol GraphicPresenterProtocol {
    // VIEW -> PRESENTER
    func getData()
}
/// Protocolo que define los métodos y atributos para el Interactor de Graphic
protocol GraphicInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    func fetchData()
}
/// Protocolo que define los métodos y atributos para el Interactor de Graphic
protocol GraphicInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    func sendErrorMessage(message: String)
    func sendData(data: GraphicEntity)
}
