//
//  ViewControllerContract.swift
//  AryaNoble
//
//  Created by Rafi Mochamad Fahreza on 25/10/22.
//

import Foundation

protocol ViewControllerViewProtocol {
    func displayAllMovie(response: ResAllMovieStruct)
    func displaySearchResult(result: ResSearchMovieStruct)
}

protocol ViewControllerViewModelProtocol {
    var view: ViewControllerViewProtocol? {get set}
    func getAllMovie()
    func searchMovie(keyword: String)
}
