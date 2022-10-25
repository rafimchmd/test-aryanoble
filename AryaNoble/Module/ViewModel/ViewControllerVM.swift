//
//  ViewControllerVM.swift
//  AryaNoble
//
//  Created by Rafi Mochamad Fahreza on 25/10/22.
//

import Foundation

class ViewControllerVM: ViewControllerViewModelProtocol {
    
    var view: ViewControllerViewProtocol?
    
    init(view: ViewControllerViewProtocol) {
        self.view = view
    }
    
    func getAllMovie() {
        IMDBService.getAllmovie(url: "\(BASE_URL)\(IMDBPath.allMovie.rawValue)", parameter: nil).subscribe { (response) in
            self.view?.displayAllMovie(response: response)
        } onError: { (error) in
            print("error get movie \(error.localizedDescription)")
        }
    }
    
    func searchMovie(keyword: String) {
        IMDBService.searchMovie(url: "\(BASE_URL)\(IMDBPath.searchMovie.rawValue)\(keyword)", parameter: nil).subscribe { (response) in
            self.view?.displaySearchResult(result: response)
        } onError: { (error) in
            print("error get movie \(error.localizedDescription)")
        }
    }
    
}
