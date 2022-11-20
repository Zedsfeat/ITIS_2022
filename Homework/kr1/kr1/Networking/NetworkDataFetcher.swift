//
//  NetworkDataFetcher.swift
//  kr1
//
//  Created by zedsbook on 19.11.2022.
//

import UIKit

class NetworkDataFetcher {
    
    private let networkService = NetworkService()
    
    func fetchData(with urlString: String, and response: @escaping (AccountResponse?) -> Void) {
        delay(1) { [weak self] in
            self?.networkService.request(urlString: urlString, completion: { result in
                switch result {
                case .success(let data):
                    do {
                        // Parsing from "data" to "decoder" of type "AccountResponse"
                        let accounts = try JSONDecoder().decode(AccountResponse.self, from: data)
                        response(accounts)
                    } catch let jsonError {
                        print("JSONError: \(jsonError)")
                    }
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                    response(nil)
                }
            })
        }
    }
    
    
    
    func load(imageView: UIImageView, with urlString: String) {
        imageView.image = nil
        networkService.request(urlString: urlString) { result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else { return }
                imageView.image = image
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func delay(_ seconds: Int, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(seconds)) {
            closure()
        }
    }
    
}
