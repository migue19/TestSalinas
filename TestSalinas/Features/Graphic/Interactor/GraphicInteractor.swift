//
//  GraphicInteractor.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import Foundation
import ConnectionLayer
class GraphicInteractor {
    var presenter: GraphicInteractorOutputProtocol?

}
extension GraphicInteractor: GraphicInteractorInputProtocol {
    func fetchData() {
        ConnectionLayer(isDebug: false).connectionRequest(url: Service.endpoint, method: .get, headers: nil, data: nil) { data, error in
            if let error = error {
                self.receiveError(message: error)
                return
            }
            guard let data = data else {
                let error = "data_not_found".localized
                self.receiveError(message: error)
                return
            }
            if let entity = Utils.decode(GraphicEntity.self, from: data, serviceName: "video_service".localized) {
                self.receiveData(data: entity)
            } else {
                let error = "decode_error".localized
                self.receiveError(message: error)
            }
        }
    }
    func receiveData(data: GraphicEntity) {
        DispatchQueue.main.async { [weak self] in
            self?.presenter?.sendData(data: data)
        }
    }
    func receiveError(message: String) {
        DispatchQueue.main.async { [weak self] in
            self?.presenter?.sendErrorMessage(message: message)
        }
    }
}
