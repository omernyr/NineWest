//
//  APICaller.swift
//  NineWest
//
//  Created by macbook pro on 21.05.2023.
//

import UIKit

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
//    static func getAllProducts(completion: @escaping (_ result: Result<ProductElement, NetworkError>) -> Void) {
//            
//        let urlString = NetworkConstant.shared.serverAddress +
//        NetworkConstant.shared.getAllProducts
//            
//            guard let url = URL(string: urlString) else {
//                return
//            }
//            
//            URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
//                
//                guard let data = data, error == nil else {
//                    completion(.failure(.canNotParseData))
//                    return }
//                
//                let results = try JSONDecoder().decode(ProductElement.self, from: data)
//                
//                completion(.success(results))
//                
//            }.resume()
//        }
}
