//
//  HomeVC.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import UIKit
import Firebase
class HomeVC: BaseViewController {
    var dataSource: [String] = []
    var color: UIColor = .red
    @IBOutlet weak var tableView: UITableView!
    var presenter: HomePresenterProtocol?
    let rootRef = Database.database().reference()
    let conditionRef = Database.database().reference().child("background")

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
    override func viewDidAppear(_ animated: Bool) {
        conditionRef.observe(.value) { [self] (snapshot) in
            if let receivedColor = snapshot.value as? String {
            self.color = UIColor(hexString: receivedColor)
            self.view.backgroundColor = self.color
            self.tableView.reloadData()
            }
        }
    }
    func getData() {
        self.presenter?.getData()
    }
}
/// Protocolo para recibir datos de presenter.
extension HomeVC: HomeViewProtocol {
    func showData(data: [String]) {
        self.dataSource = data
        self.tableView.reloadData()
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
            cell.setupCell(text: dataSource[indexPath.row], align: indexPath.row == 1 ? .center: .justified)
            cell.backgroundColor = color
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
