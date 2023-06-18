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
    let price: Double?
    let description: String?
    let category: String?
    let image: String?
    let rating: Rating?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case description = "description"
        case category = "category"
        case image = "image"
        case rating = "rating"
    }
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double?
    let count: Int?

    enum CodingKeys: String, CodingKey {
        case rate = "rate"
        case count = "count"
    }
}

typealias Products = [Product]

