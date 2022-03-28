//
//  FavoriteView.swift
//  kanye-quotes
//
//  Created by Nick Pappas on 3/28/22.
//

import UIKit

class FavoriteView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.image = UIImage(systemName: "star")
        self.tintColor = .systemPink
        self.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    

}
