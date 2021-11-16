//
//  GraphicVC.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import UIKit

class GraphicVC: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: GraphicPresenterProtocol?
    var dataSource: [QuestionEntity] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    func getData() {
        presenter?.getData()
    }
    override func setupView() {
        title = "Graficas"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: InputTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: InputTableViewCell.identifier)
        tableView.register(UINib(nibName: ActionTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ActionTableViewCell.identifier)
    }
}
/// Protocolo para recibir datos de presenter.
extension GraphicVC: GraphicViewProtocol {
    func showData(data: GraphicEntity) {
        dataSource = data.questions
        tableView.reloadData()
    }

}
extension GraphicVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
