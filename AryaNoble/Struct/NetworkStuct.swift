//
//  NetworkStuct.swift
//  AryaNoble
//
//  Created by Rafi Mochamad Fahreza on 25/10/22.
//

import Foundation

let BASE_URL = "https://imdb-api.com/en/API/"

// search
//AdvancedSearch/k_735j2x99/?title=inception
enum IMDBPath: String {
    case allMovie = "Top250Movies/k_08u7pmcy"
    case searchMovie = "AdvancedSearch/k_08u7pmcy/?title="
}
