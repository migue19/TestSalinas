//
//  ShowPhotoVC.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 15/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import UIKit

class ShowPhotoVC: BaseViewController {
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(url: URL) {
        super.init(nibName: nil, bundle: nil)
        self.downloadImageFrom(url: url, imageMode: .scaleAspectFill)
    }

    init(image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }

    public func downloadImageFrom(url: URL, imageMode: UIView.ContentMode) {
        showHUD()
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.hideHUD()
                }
                return
            }
            DispatchQueue.main.async {
                self.hideHUD()
                let imageToCache = UIImage(data: data)
                self.image = imageToCache
                self.imageView.image = self.image
            }
        }.resume()

    }
}
