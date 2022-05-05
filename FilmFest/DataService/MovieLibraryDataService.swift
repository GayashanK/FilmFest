//
//  MovieLibraryDataService.swift
//  FilmFest
//
//  Created by Kasun Gayashan on 11.02.22.
//

import UIKit

enum LibrarySection: Int {
    case moviesToSee, moviesSeen
}

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var movieManager: MovieManager?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movieManager = movieManager else {
            return 0
        }
        
        guard let librarySection = LibrarySection(rawValue: section) else {
            fatalError()
        }
        
        switch librarySection {
        case .moviesToSee:
            return movieManager.moviesToSeeCount
        case .moviesSeen:
            return movieManager.movieSeenCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieManager = movieManager, let librarySection = LibrarySection(rawValue: indexPath.section) else {
            fatalError()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: indexPath) as? MovieCell
        let movieData = librarySection.rawValue == 0 ? movieManager.movieAtIndex(index: indexPath.row) : movieManager.checkedOffMovieAtIndex(index: indexPath.row)
        cell?.configMovieCell(movie: movieData)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieManager = movieManager, let librarySection = LibrarySection(rawValue: indexPath.section) else {
            fatalError()
        }
        
        if librarySection == .moviesToSee {
            movieManager.checkOffMovieAtIndex(index: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let librarySection = LibrarySection(rawValue: section) else {
            fatalError()
        }
        
        switch librarySection {
        case .moviesToSee:
            return "Movies To See"
        case .moviesSeen:
            return "Movies Seen"
        }
    }
}
