//
//  HomeInteractor.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import Foundation

class HomeInteractor {
    var presenter: HomeInteractorOutputProtocol?
}
extension HomeInteractor: HomeInteractorInputProtocol {
    func fetchData() {
        let dataSource = DataHome().getData()
        presenter?.sendData(data: dataSource)
    }
}
