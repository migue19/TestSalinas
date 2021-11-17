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
    func sendImage() {
        let localFile = Utils.getImagePath()
        let riversRef = storageRef.child("myImage.png")
        riversRef.putFile(from: localFile, metadata: nil) { metadata, error in
            if let error = error {
                print(error)
                return
            }
            guard let metadata = metadata else {
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
    func fetchData() {
        let dataSource = DataHome().getData()
        presenter?.sendData(data: dataSource)
    }
}
