//
//  HomeViewController.swift
//  MoviesDBAssignment
//
//  Created by nishanth golla on 4/21/17.
//  Copyright © 2017 nishanth golla. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var finalData:Array<SearchResultDataModel> = []
    
    // Search Bar Delegate Method.
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let userText:String = searchBar.text!
        let finalKeyword = userText.replacingOccurrences(of: " ", with: "%20")
        self.view.endEditing(true)
        let URLWithSearchKey:String = "https://api.themoviedb.org/3/search/movie?api_key=2a474b8f91894ef105af7c3eca839548&language=en-US&query=\(finalKeyword)&page=1&include_adult=false"
        let serviceRequest = ServiceInterface()
        serviceRequest.serviceWithMovieSearchURL(url: URLWithSearchKey) { (Data, error) in
            if let receivedData = Data{
                self.finalData = receivedData as! Array<SearchResultDataModel>
                self.tableView.reloadData()
            }
        }
    
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    // Table View Controller Methods.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"reuseIdentifier", for: indexPath)
        let cellData = self.finalData[indexPath.row]
        
        cell.textLabel?.text = "\(cellData.OriginalTitle)"
        
        return cell
    }
    // For Data Passing Between the two View Controllers.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = self.tableView.indexPathForSelectedRow?.row
        
        let dVC = segue.destination as! DetailViewController
        let printData =  self.finalData[index!]        
        dVC.originalTitle = printData.OriginalTitle
        dVC.pasterPath = printData.PosterPath
        dVC.backdropPath = printData.BackDropPath
        dVC.releaseDate = printData.ReleaseDate
        dVC.popularity = printData.Populatity
        dVC.overView = printData.OverView
        
    }
    
    
    
    
    
    
    
}
