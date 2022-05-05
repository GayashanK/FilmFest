//
//  LibraryViewController.swift
//  FilmFest
//
//  Created by Kasun Gayashan on 11.02.22.
//

import UIKit

class LibraryViewController: UIViewController {
    
    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    var movieManager = MovieManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
        dataService.movieManager = movieManager
        let movie1 = Movie(title: "Kung Fu Panda", releaseDate: "2022")
        let movie2 = Movie(title: "Karate Kid")
        let movie3 = Movie(title: "Redemption")
        let movie4 = Movie(title: "Bourne Identity", releaseDate: "2012")
        let movie5 = Movie(title: "Black Hawk Down", releaseDate: "2021")
        movieManager.addMovie(movie: movie1)
        movieManager.addMovie(movie: movie2)
        movieManager.addMovie(movie: movie3)
        movieManager.addMovie(movie: movie4)
        movieManager.addMovie(movie: movie5)
        libraryTableView.reloadData()
    }
}
