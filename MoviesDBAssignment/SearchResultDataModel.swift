//
//  SearchResultDataModel.swift
//  MoviesDBAssignment
//
//  Created by nishanth golla on 4/22/17.
//  Copyright © 2017 nishanth golla. All rights reserved.
//

import UIKit

class SearchResultDataModel: NSObject {
    
    private var _posterPath:String?
    private var _overView:String?
    private var _releaseDate:String?
    private var _originalTitle:String?
    private var _backdropPath:String?
    private var _popularity:Double?
    
    init(dict: NSDictionary) {
        
        (dict.object(forKey: "poster_path") != nil) ? (self._posterPath = dict.object(forKey: "poster_path") as? String) : (self._posterPath = "N/A")
        (dict.object(forKey: "overview") != nil) ? (self._overView = dict.object(forKey: "overview") as? String) : (self._overView = "N/A")
        (dict.object(forKey: "release_date") != nil) ? (self._releaseDate = dict.object(forKey: "release_date") as? String) : (self._releaseDate = "N/A")
        (dict.object(forKey: "original_title") != nil) ? (self._originalTitle = dict.object(forKey: "original_title") as? String) : (self._originalTitle = "N/A")
        (dict.object(forKey: "backdrop_path") != nil) ? (self._backdropPath = dict.object(forKey: "backdrop_path") as? String) : (self._backdropPath = "N/A")
        (dict.object(forKey: "popularity") != nil) ? (self._popularity = dict.object(forKey: "popularity") as? Double) : (self._popularity = 0)
    }
    
    
    var PosterPath:String{
        get{
            return (_posterPath != nil) ? _posterPath! : "N/A"
        }
        set{
            _posterPath = newValue
        }
    }
    
    var OverView:String{
        get{
            return (_overView != "") ? _overView! : "Sorry Not Avialable"
        }
        set{
            _overView = newValue
        }
    }
    
    var ReleaseDate:String{
        get{
            return (_releaseDate != "") ? _releaseDate! : "Sorry Not Avialable"
        }
        set{
            _releaseDate = newValue
        }
        
    }
    
    var OriginalTitle:String{
        get{
            return _originalTitle!
        }
        set{
            _originalTitle = newValue
        }
    }
    
    var BackDropPath:String{
        get{
            return (_backdropPath != nil) ? _backdropPath! : "N/A"
        }
        set{
            _backdropPath = newValue
        }
    }
    
    var Populatity:Double{
        get{
            return (_popularity != nil) ? _popularity! : 0.00
        }
        set{
            _popularity = newValue
        }
    }


}
