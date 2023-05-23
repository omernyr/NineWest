//
//  ShoesModel.swift
//  NineWest
//
//  Created by macbook pro on 21.05.2023.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let products = try? JSONDecoder().decode(Products.self, from: jsonData)
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let products = try? JSONDecoder().decode(Products.self, from: jsonData)
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let products = try? JSONDecoder().decode(Products.self, from: jsonData)

import Foundation

// MARK: - Product
struct Product: Codable {
    let id: Int?
    let title: String?
    let price: Int?
    let description: String?
    let images: [String]?
    let creationAt: String?
    let updatedAt: String?
    let category: Category?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case description = "description"
        case images = "images"
        case creationAt = "creationAt"
        case updatedAt = "updatedAt"
        case category = "category"
    }
}

// MARK: - Category
struct Category: Codable {
    let id: Int?
    let name: String?
    let image: String?
    let creationAt: String?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case image = "image"
        case creationAt = "creationAt"
        case updatedAt = "updatedAt"
    }
}

typealias Products = [Product]
