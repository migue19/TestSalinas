//
//  BaseProtocol.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 16/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import Foundation
import SwiftMessages
/// Protocolo general para las vistas.
protocol GeneralView {
    /// Función para mostrar un mensaje en una alerta.
    /// - Parameter message: Cadena con el mensaje a mostrarse en la alerta.
    func showMessage(message: String, type: Theme)
    func showHUD()
    func hideHUD()
}
extension GeneralView {
    func showMessage(message: String) {
    }
}
