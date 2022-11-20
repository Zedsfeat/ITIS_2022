//
//  NetworkService.swift
//  kr1
//
//  Created by zedsbook on 19.11.2022.
//

import Foundation


class NetworkService {
    
    func request(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                if let error {
                    completion(.failure(error))
                    return
                }
                guard let data else { return }
                completion(.success(data))
            }
        }.resume()
    }
    
}

