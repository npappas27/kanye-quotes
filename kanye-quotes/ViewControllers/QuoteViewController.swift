//
//  QuoteViewController.swift
//  kanye-quotes
//
//  Created by Nick Pappas on 3/28/22.
//

import UIKit

class QuoteViewController: UIViewController {
    
    var quoteLabel = UILabel(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureQuoteLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getInitialQuote()
        
    }
    
    private func getInitialQuote() {
        NetworkManager.shared.getQuote { quote in
            if let quote = quote {
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.quoteLabel.text = quote
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
    
}
