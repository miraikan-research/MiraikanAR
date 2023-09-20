//
//  ARMarkerViewController.swift
//  NavCogMiraikan
//
//  Created by yoshizawr204 on 2022/10/26.
//

import Foundation

class ARMarkerViewController: UIViewController {

    var idLabel = UILabel()
    var arImage = UIImageView()

    var selectedId = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(idLabel)
        self.view.addSubview(arImage)

        arImage.translatesAutoresizingMaskIntoConstraints = false
        var width = arImage.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6)
        let height = arImage.heightAnchor.constraint(equalTo: arImage.widthAnchor)
        var centerX = arImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let centerY = arImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        NSLayoutConstraint.activate([width, height, centerX, centerY])

        idLabel.lineBreakMode = .byWordWrapping
        idLabel.textAlignment = .center
        idLabel.numberOfLines = 0
        idLabel.font = .preferredFont(forTextStyle: .headline)
        idLabel.textColor = .label
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        width = idLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        centerX = idLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let top = idLabel.topAnchor.constraint(equalTo: arImage.bottomAnchor)
        NSLayoutConstraint.activate([width, centerX, top])


        idLabel.text = String(selectedId)
        if let image = OpenCVWrapper.createARMarker(Int32(selectedId)) {
            arImage.image = image
        }
    }
}
