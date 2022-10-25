//
//  ResAllMovieStruct.swift
//  AryaNoble
//
//  Created by Rafi Mochamad Fahreza on 25/10/22.
//

import Foundation

// MARK: - ResMovieStruct
struct ResAllMovieStruct: Codable {
    let items: [Item]
    let errorMessage: String
}

// MARK: - Item
struct Item: Codable {
    let id, rank, title, fullTitle: String
    let year: String
    let image: String
    let crew, imDBRating, imDBRatingCount: String

    enum CodingKeys: String, CodingKey {
        case id, rank, title, fullTitle, year, image, crew
        case imDBRating = "imDbRating"
        case imDBRatingCount = "imDbRatingCount"
    }
}
