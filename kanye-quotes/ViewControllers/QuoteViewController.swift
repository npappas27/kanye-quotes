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
        
        NetworkManager.shared.getQuote { quote in
            print(quote)
        }
    }
    
    
    func configureQuoteLabel() {
        let padding: CGFloat = 12
        view.addSubview(quoteLabel)
        quoteLabel.text = "I'm giving all Good music artists back the 50% share I have of their masters" // default
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        quoteLabel.textColor = .label
        quoteLabel.font = UIFont.systemFont(ofSize: 18)
        quoteLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            quoteLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            quoteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            quoteLabel.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            quoteLabel.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

}
