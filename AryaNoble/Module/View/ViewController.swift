//
//  ViewController.swift
//  AryaNoble
//
//  Created by Rafi Mochamad Fahreza on 25/10/22.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var movieTableVie: UITableView!
    var vm: ViewControllerViewModelProtocol?
    var movie: [Item] = [Item]()
    var result: [Result] = [Result]()
    var isMovieLoad: Bool = false
    var isSearch: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm = ViewControllerVM(view: self)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupDelegate()
        vm?.getAllMovie()
    }
    
    private func setupDelegate() {
        movieTableVie.delegate = self
        movieTableVie.dataSource = self
        searchBar.delegate = self
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.textColor = .black
        }
        movieTableVie.setupBackground()
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch {
            return self.result.count
        } else {
            if isMovieLoad {
                return movie.count
            } else {
                return 5
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        if isSearch {
            cell.coverImageView.kf.setImage(with: URL(string: self.result[indexPath.row].image))
            cell.ratingLabel.text = "-"
            cell.titleLabel.text = self.result[indexPath.row].title
        } else {
            if isMovieLoad {
                cell.coverImageView.hideShimmer()
                cell.ratingView.hideShimmer()
                cell.titleLabel.hideShimmer()
                
                cell.coverImageView.kf.setImage(with: URL(string: self.movie[indexPath.row].image))
                cell.ratingLabel.text = self.movie[indexPath.row].rank
                cell.titleLabel.text = self.movie[indexPath.row].title
            } else {
                cell.coverImageView.loadShimmer(cornerRadius:4)
                cell.ratingView.loadShimmer(cornerRadius:4)
                cell.titleLabel.loadShimmer(cornerRadius:4)
            }
        }
        return cell
    }

}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearch = true
        if let text = searchBar.text {
            self.vm?.searchMovie(keyword:text)
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            self.isSearch = false
            movieTableVie.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.isSearch = false
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.resignFirstResponder()
        }
        movieTableVie.reloadData()
    }
}

extension ViewController: ViewControllerViewProtocol {
    func displayAllMovie(response: ResAllMovieStruct) {
        self.movie = response.items
        self.isMovieLoad = true
        self.movieTableVie.reloadData()
    }
    
    func displaySearchResult(result: ResSearchMovieStruct) {
        self.result = result.results
        self.movieTableVie.reloadData()
    }
}
