//
//  Movies.swift
//  MoviesJ1
//
//  Created by Jakkawad Chaiplee on 7/25/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import Foundation
import Alamofire


import SwiftyJSON

class Movie {
    var name:String
    var imageURL:String
    var movieDescription:String
    
    func updateImageURL() {
        let parameters:[String: AnyObject] = [
            "t": name,
            "y": "",
            "plot": "short",
            "r": "json"
        ]
        let omdbAPI = "https://www.omdbapi.com/"
        Alamofire.request(.GET, omdbAPI, parameters: parameters).responseJSON() { response in
            guard let dataValue = response.result.value else { return }
            var json = JSON(dataValue)
            print(json)
            self.imageURL = json["Poster"].stringValue
            self.name = json["Title"].stringValue
            self.movieDescription = json["Plot"].stringValue
            
        }
    }
    init(name: String) {
        self.name = name
        self.imageURL = ""
        self.movieDescription = ""
        updateImageURL()
    }
    
}

class Category {
    static let sharedInstance = Category()
    let genres:[Genre]
    let movie = MovieList()
    
    init() {
        let movie1Cat1 = Movie(name: movie.movie1)
        let movie2Cat1 = Movie(name: movie.movie2)
        let category1 = Genre(_name: "Category 1", _movies: [movie1Cat1, movie2Cat1])
        
        let movie1Cat2 = Movie(name: movie.movie3)
        let movie2Cat2 = Movie(name: movie.movie4)
        let category2 = Genre(_name: "Category 2", _movies: [movie1Cat2, movie2Cat2])
        
        let movie1Cat3 = Movie(name: movie.movie5)
        let movie2Cat3 = Movie(name: movie.movie6)
        let category3 = Genre(_name: "Category 3", _movies: [movie1Cat3, movie2Cat3])
        genres = [category1, category2, category3]
    }
    
}

class Genre {
    let name:String
    let movies:[Movie]
    
    init(_name:String, _movies:[Movie]) {
        self.name = _name
        self.movies = _movies
    }
}

class MovieList {
    let movie1:String
    let movie2:String
    let movie3:String
    let movie4:String
    let movie5:String
    let movie6:String
    
    func loadMovie() {
        // Alamofire load MovieLish
    }
    
    init() {
        movie1 = "The Flash"
        movie2 = "Man of Steel"
        movie3 = "Suicide Squad"
        movie4 = "Batman v Superman: Dawn of Justice"
        movie5 = "Justice League"
        movie6 = "Aquaman"
        
    }
}