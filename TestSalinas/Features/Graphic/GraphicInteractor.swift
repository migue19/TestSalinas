//
//  GraphicInteractor.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import Foundation

class GraphicInteractor {
    var presenter: GraphicInteractorOutputProtocol?

}
extension GraphicInteractor: GraphicInteractorInputProtocol {
}
