//
//  Product.swift
//  eCommerce Application
//
//  Created by Habibur Rahman on 6/8/23.


import Foundation

// MARK: - Product
struct Product: Codable {
    let products: [ProductElement]?
    let total, skip, limit: Int?
}

// MARK: - ProductElement
struct ProductElement: Codable {
    let id: Int?
    let title, description: String?
    let price: Int?
    let discountPercentage, rating: Double?
    let stock: Int?
    let brand, category: String?
    let thumbnail: String?
    let images: [String]?
}



