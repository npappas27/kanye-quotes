//
//  NetworkManager.swift
//  kanye-quotes
//
//  Created by Nick Pappas on 3/28/22.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    private let endpoint = URL(string: "https://api.kanye.rest")
    
    func getQuote(completed: @escaping (String?) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: endpoint!) { data, response, error in
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200, error == nil else { return }
            
            do {
                var quote = try JSONDecoder().decode(Quote.self, from: data)
                completed(quote.quote)
            } catch {
                completed(nil)
            }
        }
        dataTask.resume()
    }
    
    
}
