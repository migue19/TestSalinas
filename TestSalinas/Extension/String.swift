//
//  String.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import Foundation
extension String {
    /// Función que encapsula la llamada al archivo strings del proyecto.
    ///     - Returns: Regresa el texto correcto del archivo strings o el mismo.
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
