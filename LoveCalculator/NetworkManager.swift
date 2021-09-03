//
//  NetworkManager.swift
//  LoveCalculator
//
//  Created by Иван on 9/3/21.
//

import Foundation

struct NetworkManager {
    
    let headers = [
        "x-rapidapi-host": "love-calculator.p.rapidapi.com",
        "x-rapidapi-key": "ba14580f68msh06638a18d05aad4p11c9e7jsnfa5e77550c8f"
    ]
    
    func makeURLrequest(with url: String, returned percentage: @escaping (Model) -> Void) {
        
        guard let url = URL(string: url) else {
            print("Error creating url")
            return
        }
        var request = URLRequest(url: url,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let value = try jsonDecoder.decode(Model.self, from: data)
                    percentage(value)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
            if let error = error {
                print(error.localizedDescription)
            }
        }).resume()
    }
}
