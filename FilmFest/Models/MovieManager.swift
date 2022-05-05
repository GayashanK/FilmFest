//
//  MovieManager.swift
//  FilmFest
//
//  Created by Kasun Gayashan on 11.02.22.
//

import Foundation

class MovieManager {
    var moviesToSeeCount: Int { return moviesToSee.count }
    var movieSeenCount: Int { return moviesSeen.count }
    private var moviesToSee: [Movie] = []
    private var moviesSeen: [Movie] = []
    
    func addMovie(movie: Movie) {
        if !moviesToSee.contains(movie) {
            self.moviesToSee.append(movie)
        }
    }
    
    func movieAtIndex(index: Int) -> Movie {
        return moviesToSee[index]
    }
    
    func checkOffMovieAtIndex(index: Int) {
        guard index < self.moviesToSeeCount else {
            return
        }
        
        let checkedMovie = self.moviesToSee.remove(at: index)
        self.moviesSeen.append(checkedMovie)
    }
    
    func checkedOffMovieAtIndex(index: Int) -> Movie {
        return moviesSeen[index]
    }
    
    func clearArrays() {
        self.moviesSeen.removeAll()
        self.moviesToSee.removeAll()
    }
}
