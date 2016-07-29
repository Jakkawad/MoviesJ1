//
//  ViewController.swift
//  MoviesJ1
//
//  Created by Jakkawad Chaiplee on 7/25/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView:UITableView!
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Category.sharedInstance.genres[section].name
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return Category.sharedInstance.genres.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell0 = tableView.dequeueReusableCellWithIdentifier("tableCell0") as! Cell0TableViewCell
            cell0.genre = Category.sharedInstance.genres[indexPath.section]
            return cell0
        } else if indexPath.section == 1 {
            let cell1 = tableView.dequeueReusableCellWithIdentifier("tableCell1") as! Cell1TableViewCell
            cell1.genre = Category.sharedInstance.genres[indexPath.section]
            return cell1
        } else {
            let cell2 = tableView.dequeueReusableCellWithIdentifier("tableCell2") as! Cell2TableViewCell
            cell2.genre = Category.sharedInstance.genres[indexPath.section]
            return cell2
        }
    }
    
    func delay(seconds seconds: Double, completion:()->()) {
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64 (Double(NSEC_PER_SEC) * seconds ))
        dispatch_after(popTime, dispatch_get_main_queue()) {
            completion()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let videoCell = sender as? Cell0CollectionViewCell,
            let videoDetailPage = segue.destinationViewController as? SecondViewController {
            let movie = videoCell.movie
            print("Movie = \(movie)")
            print("Cell = \(videoCell)")
            videoDetailPage.movie = movie
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delay(seconds: 1.0) {
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

