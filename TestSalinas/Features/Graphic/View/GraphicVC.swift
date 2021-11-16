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
    var colors: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    func getData() {
        presenter?.getData()
    }
    override func setupView() {
        title = "section_graphic".localized
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: GraphicTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: GraphicTableViewCell.identifier)
    }
}
/// Protocolo para recibir datos de presenter.
extension GraphicVC: GraphicViewProtocol {
    func showData(data: GraphicEntity) {
        dataSource = data.questions
        colors = data.colors
        tableView.reloadData()
    }

}
extension GraphicVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: GraphicTableViewCell.identifier) as? GraphicTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(question: dataSource[indexPath.row], colors: colors)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
