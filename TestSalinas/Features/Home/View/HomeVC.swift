//
//  HomeVC.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import UIKit
import NutUtils
class HomeVC: BaseViewController {
    var dataSource: [DataHome] = []
    var color: UIColor = .red
    @IBOutlet weak var tableView: UITableView!
    var presenter: HomePresenterProtocol?

    override func setupView() {
        title = "section_home".localized
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: InputTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: InputTableViewCell.identifier)
        tableView.register(UINib(nibName: ActionTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ActionTableViewCell.identifier)
    }
    override func viewDidLoad() {
        getData()
        setupView()
    }
    func getData() {
        self.presenter?.getData()
    }
    @IBAction func sendImage(_ sender: Any) {
        self.presenter?.touchSendImage()
    }
}
/// Protocolo para recibir datos de presenter.
extension HomeVC: HomeViewProtocol {
    func updateRemoteConfig(config: RemoteConfig) {
        self.color = config.color
        self.view.backgroundColor = config.color
        self.tableView.reloadData()
    }
    func showData(data: [DataHome]) {
        self.dataSource = data
        self.tableView.reloadData()
    }
    func showPhoto(url: URL) {
        let imageController = ShowPhotoVC(url: url)
        self.present(imageController, animated: true, completion: nil)
    }
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
            cell.backgroundColor = color
            return cell
        case 1, 2:
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: ActionTableViewCell.identifier) as? ActionTableViewCell else {
                return UITableViewCell()
            }
            let text = dataSource[indexPath.row].description
            cell.setupCell(text: text.valueOrEmpty, align: indexPath.row == 1 ? .center: .justified)
            cell.backgroundColor = color
            return cell
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let size = dataSource[indexPath.row].sizeCell
        return size.valueOrZero
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            self.showPickerSelfie()
        case 2:
            self.presenter?.tapGraphicOption()
        default:
            break
        }
    }
    func showPickerSelfie() {
        ImagePickerManager().pickImage(self) { image in
            self.showPhoto(image: image)
        }
    }
    func showPhoto(image: UIImage) {
        let imageController = ShowPhotoVC(image: image)
        self.present(imageController, animated: true, completion: nil)
    }
}
