//
//  Movie.swift
//  FilmFest
//
//  Created by Kasun Gayashan on 10.02.22.
//

import Foundation

struct Movie: Equatable {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}

//func==(lhs: Movie, rhs:Movie) -> Bool {
//    if lhs.title != rhs.title {
//        return false
//    }
//    
//    if (lhs.releaseDate != lhs.releaseDate) {
//        return false
//    }
//    
//    return true
//}
