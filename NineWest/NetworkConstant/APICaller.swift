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
    case categoryURLError
    case categoryCanNotParseData
}

public class APICaller {
    
    static func getAllProducts(completion: @escaping (_ result: Result<Products, NetworkError>) -> Void) {
        
        let urlString = NetworkConstant.shared.serverAddress + NetworkConstant.shared.getAllProducts
        
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, err in
            
            guard let data = data, err == nil else { completion(.failure(.urlError)); return }
            
            do {
                let results = try JSONDecoder().decode(Products.self, from: data)
                completion(.success(results))
                
            } catch {
                completion(.failure(.canNotParseData))
            }
            
        }.resume()
        
    }
    
    static func getAllCategorys(completion: @escaping (_ result: Result<Categories, NetworkError>) -> Void) {
        
        let urlString = NetworkConstant.shared.serverAddress + NetworkConstant.shared.getAllCategories
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, err in
            
            guard let data = data, err == nil else { completion(.failure(.categoryURLError)); return }
            
            do {
                let results = try JSONDecoder().decode(Categories.self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(.categoryCanNotParseData))
            }
            
        }.resume()
    }
}
