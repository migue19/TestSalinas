//
//  HomeInteractor.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage
class HomeInteractor {
    var presenter: HomeInteractorOutputProtocol?
    let storageRef = Storage.storage().reference()
    let rootRef = Database.database().reference()
    let conditionRef = Database.database().reference().child("background")

    init() {
        conditionRef.observe(.value) { [self] (snapshot) in
            if let receivedColor = snapshot.value as? String {
                let remoteConfig = RemoteConfig(color: UIColor(hexString: receivedColor))
                presenter?.sendRemoteConfig(config: remoteConfig)
            }
        }
    }
}
extension HomeInteractor: HomeInteractorInputProtocol {
    func sendImage(name: String) {
        let formatName = formatNameImage(name: name)
        let localFile = Utils.getImagePath()
        let riversRef = storageRef.child("\(formatName).png")
        riversRef.putFile(from: localFile, metadata: nil) { [weak self] metadata, error in
            guard let self = self else {
                print("self_not_found".localized)
                return
            }
            if let error = error {
                self.sendError(error: error.localizedDescription)
                return
            }
            guard let metadata = metadata else {
                self.sendError(error: "metadata_not_found".localized)
                return
            }
            print(metadata)
            riversRef.downloadURL { (url, _) in
                guard let downloadURL = url else {
                    return
                }
                self.presenter?.sendPhoto(url: downloadURL)
            }
        }
    }
    private func sendError(error: String) {
        presenter?.sendError(error: error)
    }
    private func formatNameImage(name: String) -> String {
        var formatName = name.lowercased()
        formatName = formatName.replacingOccurrences(of: " ", with: "")
        return formatName
    }
    func fetchData() {
        let dataSource = DataHome().getData()
        presenter?.sendData(data: dataSource)
    }
}
