//
//  HomeVC.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import UIKit

class HomeVC: BaseViewController {
    var dataSource = ["Input", "Tomar Selfie", "Una gráfica o representación gráfica es un tipo de representación de datos, generalmente numéricos, mediante recursos visuales (líneas, vectores, superficies o símbolos), para que se manifieste visualmente la relación matemática o correlación estadística que guardan entre sí. También es el nombre de un conjunto de puntos que se plasman en coordenadas cartesianas y sirven para analizar el comportamiento de un proceso o un conjunto de elementos o signos que permiten la interpretación de un fenómeno. La representación gráfica permite establecer valores que no se han obtenido experimentalmente sino mediante la interpolación (lectura entre puntos) y la extrapolación (valores fuera del intervalo experimental)."]
    @IBOutlet weak var tableView: UITableView!
    var presenter: HomePresenterProtocol?

    override func setupView() {
        title = "Home"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: InputTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: InputTableViewCell.identifier)
        tableView.register(UINib(nibName: ActionTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ActionTableViewCell.identifier)
    }
}
/// Protocolo para recibir datos de presenter.
extension HomeVC: HomeViewProtocol {
}
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: InputTableViewCell.identifier) as? InputTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case 1, 2:
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: ActionTableViewCell.identifier) as? ActionTableViewCell else {
                return UITableViewCell()
            }
            cell.setupCell(text: dataSource[indexPath.row], align: indexPath.row == 1 ? .center: .justified)
            return cell
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 60
        case 1:
            return 70
        case 2:
            return 400
        default:
            return 45
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            ImagePickerManager().pickImage(self) { image in
                self.showPhoto(image: image)
            }
        case 2:
            self.presenter?.tapGraphicOption()
        default:
            break
        }
    }
    func showPhoto(image: UIImage) {
        let imageController = ShowPhotoVC(image: image)
        self.present(imageController, animated: true, completion: nil)
    }
}
