//
//  DetailViewController.swift
//  MoviesDBAssignment
//
//  Created by nishanth golla on 4/22/17.
//  Copyright © 2017 nishanth golla. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    var pasterPath: String = " "
    var backdropPath: String = " "
    var originalTitle:String = " "
    var overView:String = " "
    var releaseDate:String = " "
    var popularity:Double = 0

    @IBOutlet weak var backPosterImage: UIImageView! 
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var originalTitleTextField: UILabel!
    @IBOutlet weak var releaseDataTextField: UILabel!
    @IBOutlet weak var popularityTextField: UILabel!
    @IBOutlet weak var DescriptionTextField: UITextView!
    
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
            originalTitleTextField.text = originalTitle
            releaseDataTextField.text = "Release Date: " + releaseDate
            popularityTextField.text = "Popularity: " + String(popularity)
            DescriptionTextField.text = overView
            DescriptionTextField.isEditable = false
    }
    
    
   override func viewWillAppear(_ animated: Bool) {
    // Getting the UIImage Data from the URL
    let PosterUrl:String = "https://image.tmdb.org/t/p/w500" + pasterPath
    let BackGroundPosterPathUrl:String = "https://image.tmdb.org/t/p/w500" + backdropPath
    
    if (pasterPath != "N/A"){
    let url = NSURL(string: PosterUrl)
    let data = NSData(contentsOf: url as! URL)
    posterImage.image = UIImage(data: data as! Data)
    }else
    {
        posterImage.image = UIImage(named: "MovieImage.png")
    }
    
    if (backdropPath != "N/A"){
        let url = NSURL(string: BackGroundPosterPathUrl)
        let data = NSData(contentsOf: url as! URL)
        backPosterImage.image = UIImage(data: data as! Data)
    }else
    {
        backPosterImage.image = UIImage(named: "BackGroundPoster.png")
    }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
