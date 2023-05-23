//
//  CategorysModel.swift
//  NineWest
//
//  Created by macbook pro on 23.05.2023.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let categories = try? JSONDecoder().decode(Categories.self, from: jsonData)

import Foundation

// MARK: - Category
struct ProdCategory: Codable {
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

typealias Categories = [ProdCategory]
