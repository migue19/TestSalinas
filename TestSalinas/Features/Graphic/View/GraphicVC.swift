//
//  GraphicVC.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import UIKit

class GraphicVC: UIViewController {

    var presenter: GraphicPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
/// Protocolo para recibir datos de presenter.
extension GraphicVC: GraphicViewProtocol {
}
