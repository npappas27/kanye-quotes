//
//  QuoteViewController.swift
//  kanye-quotes
//
//  Created by Nick Pappas on 3/28/22.
//

import UIKit

class QuoteViewController: UIViewController {
    
    var quoteLabel = UILabel(frame: .zero)
    var kanyeImage = UIImageView(frame: .zero)
    var favoriteView = FavoriteView(frame: .zero)
    var tapRecognizer: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureQuoteLabel()
        setupGestureRecog()
        configureFavoriteView()
//        configureKanyeImage()
    }
    
    func setupGestureRecog() {
        tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(fugmah))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getInitialQuote()
        
    }
    @objc func fugmah(){
        print("fugmah")
    }
    
    private func getInitialQuote() {
        NetworkManager.shared.getQuote { quote in
            if let quote = quote {
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.quoteLabel.text = "'" + quote + "'"
                
                }
            }
        }
    }
    
    
    private func configureQuoteLabel() {
        let padding: CGFloat = 12
        view.addSubview(quoteLabel)
        quoteLabel.text = "I'm giving all Good music artists back the 50% share I have of their masters" // default
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        quoteLabel.textColor = .label
        quoteLabel.layer.zPosition = 1
        quoteLabel.font = UIFont.systemFont(ofSize: 18)
        quoteLabel.textAlignment = .center
        quoteLabel.numberOfLines = 4
        NSLayoutConstraint.activate([
            quoteLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            quoteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            quoteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            quoteLabel.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    private func configureKanyeImage() {
        view.addSubview(kanyeImage)
        kanyeImage.layer.zPosition = 0
        kanyeImage.image = UIImage(named: "kanye")
        kanyeImage.backgroundColor = UIColor.clear
        kanyeImage.isOpaque = false
        kanyeImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            kanyeImage.topAnchor.constraint(equalTo: view.topAnchor),
            kanyeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            kanyeImage.widthAnchor.constraint(equalToConstant: 400),
            kanyeImage.heightAnchor.constraint(equalToConstant: 600)
        ])
        
    }
    
    private func configureFavoriteView() {
        view.addSubview(favoriteView)
        favoriteView.isUserInteractionEnabled = true
        favoriteView.addGestureRecognizer(tapRecognizer)
        NSLayoutConstraint.activate([
            favoriteView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80),
            favoriteView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
}
