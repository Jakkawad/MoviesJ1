//
//  Cell1TableViewCell.swift
//  MoviesJ1
//
//  Created by Jakkawad Chaiplee on 7/29/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class Cell1TableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView:UICollectionView!
    
    var genre:Genre? = nil {
        didSet {
            collectionView.reloadData()
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genre!.movies.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell0 = collectionView.dequeueReusableCellWithReuseIdentifier("collectCell1", forIndexPath: indexPath) as! Cell1CollectionViewCell
        if let genre = genre {
            cell0.movie = genre.movies[indexPath.row]
        }
        return cell0
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        /*
         let itemPerRow:CGFloat = 4
         let hardCodedPadding:CGFloat = 5
         let itemWidth = (collectionView.bounds.width / itemPerRow) - hardCodedPadding
         let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
         return CGSize(width: itemWidth, height: itemHeight)
         */
        let itemPerRow:CGFloat = 4
        let hardCodedPadding:CGFloat = 5
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        let itemWidth = itemHeight * 300 / 444
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
