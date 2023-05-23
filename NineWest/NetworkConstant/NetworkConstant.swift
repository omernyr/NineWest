//
//  NetworkConstant.swift
//  NineWest
//
//  Created by macbook pro on 21.05.2023.
//

import Foundation

struct NetworkConstant {
    
    static let shared: NetworkConstant = NetworkConstant()
    
    public var serverAddress: String {
        get {
            return "https://api.escuelajs.co/api/v1/"
        }
    }
    
    public var getAllProducts: String {
        get {
            return "products"
        }
    }
    
    public var getAllCategories: String {
        get {
            return "categories"
        }
    }
    
    
    
}

