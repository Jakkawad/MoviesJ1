//
//  ViewController.swift
//  MoviesJ1
//
//  Created by Jakkawad Chaiplee on 7/25/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var movie = Movie()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movie.updateImageURL()
        print(movie.name)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

