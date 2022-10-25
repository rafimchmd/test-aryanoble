//
//  ResSearchMovieStruct.swift
//  AryaNoble
//
//  Created by Rafi Mochamad Fahreza on 25/10/22.
//

import Foundation

struct ResSearchMovieStruct: Codable {
    let queryString: String
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id: String
    let image: String
    let title: String
}
