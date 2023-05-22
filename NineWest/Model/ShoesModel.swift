//
//  ShoesModel.swift
//  NineWest
//
//  Created by macbook pro on 21.05.2023.
//

import Foundation

// MARK: - ResultElement
struct ProductElement: Codable {
    let id: Int?
    let title: String?
    let price: Int?
    let description: String?
    let images: [String]?
    let creationAt, updatedAt: String?
    let category: Category?
}

// MARK: - Category
struct Category: Codable {
    let id: Int?
    let name: Name?
    let image: String?
    let creationAt, updatedAt: At?
}

enum At: String, Codable {
    case the20230521T073353000Z = "2023-05-21T07:33:53.000Z"
    case the20230521T151410000Z = "2023-05-21T15:14:10.000Z"
}

enum Name: String, Codable {
    case electronics = "Electronics"
    case furniture = "Furniture"
    case others = "Others"
    case rings = "Rings"
    case shoes = "Shoes"
}

typealias Product = [ProductElement]
