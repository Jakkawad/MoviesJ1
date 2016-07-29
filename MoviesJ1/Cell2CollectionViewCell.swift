//
//  Cell2CollectionViewCell.swift
//  MoviesJ1
//
//  Created by Jakkawad Chaiplee on 7/29/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import AlamofireImage

class Cell2CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageViewProduct:UIImageView!
    var movie:Movie? = nil {
        didSet {
            if let movie = movie,
                let url = NSURL(string: movie.imageURL) {
                self.imageViewProduct.af_setImageWithURL(url)
            }
        }
    }
}
