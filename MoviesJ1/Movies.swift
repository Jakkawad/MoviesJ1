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
    var name:String?
    var imageURL:String?
    var movieDescription:String?
    
    func updateImageURL() {
        
        Alamofire.request(.GET, "http://swapi.co/api/people/1/").responseJSON() { response in
            guard let dataValue = response.result.value else { return }
            var json = JSON(dataValue)
            //print(json)
            self.name = json["name"].stringValue
            print(self.name)
        }
    }
    /*
    init() {
        updateImageURL()
    }
    */
    
}

class Category {
    static let sharedInstance = Category()
    
}

class Genre {
    let name:String
    let movies:[Movie]
    
    init(_name:String, _movies:[Movie]) {
        self.name = _name
        self.movies = _movies
    }
}