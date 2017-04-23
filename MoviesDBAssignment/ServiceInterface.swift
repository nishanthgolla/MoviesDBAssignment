//
//  ServiceInterface.swift
//  MoviesDBAssignment
//
//  Created by nishanth golla on 4/21/17.
//  Copyright © 2017 nishanth golla. All rights reserved.
//

import UIKit

class ServiceInterface: NSObject {
    
    
    // The responseData retrieves response and save it in SearchResultsSet
    
        func serviceWithMovieSearchURL(url:String,WithCompletion:@escaping (AnyObject?,NSError?)->Void){
        let urLRequest = URL(string: url)
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: urLRequest!) { (Data, URLResponse, Error) in
            
            if Error == nil{
            if let JsonDataNew = Data {
                do{
                    var searchResultsSet:Array<Any> = []
                    let finalJson:NSDictionary =  try JSONSerialization.jsonObject(with: JsonDataNew, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    let DatafromJson: Array<Any> = finalJson.object(forKey: "results") as! Array<Any>
                    for each in (DatafromJson as Array<Any>){
                    let finalDict = (each as! Dictionary<String, Any>)
                    let searchResults:SearchResultDataModel = SearchResultDataModel(dict: finalDict as NSDictionary )
                    searchResultsSet.append(searchResults)
                        DispatchQueue.main.async {
                            WithCompletion(searchResultsSet as AnyObject?, nil)
                        }
                    }
                }
                catch let jsonError as NSError{
                    DispatchQueue.main.async {
                        WithCompletion(nil, jsonError)
                    }
                }
                
            }else {
                print("Data is empty")
                return
                }
            }
            
        }
        task.resume()
    }
    
}

