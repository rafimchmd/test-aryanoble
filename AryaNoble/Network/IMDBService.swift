//
//  IMDBService.swift
//  AryaNoble
//
//  Created by Rafi Mochamad Fahreza on 25/10/22.
//

import Foundation
import RxSwift
import Alamofire

class IMDBService: NetworkManager {
    
    static func getAllmovie(url: String, parameter: Parameters?) -> Observable<ResAllMovieStruct> {
        return getApi(object: ResAllMovieStruct.self, url: url, parameter: parameter)
    }
    
    static func searchMovie(url: String, parameter: Parameters?) -> Observable<ResSearchMovieStruct> {
        return getApi(object: ResSearchMovieStruct.self, url: url, parameter: parameter)
    }
}
