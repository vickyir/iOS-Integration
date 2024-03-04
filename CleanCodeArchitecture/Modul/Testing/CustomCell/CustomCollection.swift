//
//  CustomCollection.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 29/02/24.
//

import Foundation
import UIKit

class CustomCollection: UICollectionViewCell {
    
    var circleImage: UIImageView = {
        let image = UIImageView()
        image.maskImageCircle()
        image.image = UIImage(named: "thumbnail")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    var lblCollection: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Testing"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView(){
        addSubview(circleImage)
        addSubview(lblCollection)
    }
    
    func setConstraint(){
        NSLayoutConstraint.activate([
            circleImage.topAnchor.constraint(equalTo: topAnchor),
            circleImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleImage.widthAnchor.constraint(equalToConstant: 100),
            circleImage.heightAnchor.constraint(equalToConstant: 100),
            
            lblCollection.topAnchor.constraint(equalTo: circleImage.bottomAnchor, constant: 20),
            lblCollection.centerXAnchor.constraint(equalTo: centerXAnchor),
            lblCollection.widthAnchor.constraint(equalToConstant: 72)
        ])
    }
}
