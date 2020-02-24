//
//  ItunesConnection.swift
//  DesafioBCI
//
//  Created by Carlos Sepulveda on 24-02-20.
//  Copyright © 2020 Carlos Sepulveda. All rights reserved.
//

import UIKit

class ItunesConnection: NSObject{
    class func getAlbumForString(searchString:String, completionHandler:(Model)->()){
        let escapedString = searchString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let url = URL(string: "https://itunes.apple.com/search?term=\(escapedString ?? "")&mediaType=music&limit=20")
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                
                do{
                    let itunesDict = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                    let resultArray = (itunesDict as AnyObject).object(forKey: "results") as! [Dictionary<String,AnyObject>]
                    if resultArray.count > 0{
                        if let resultsDict = resultArray.first{
                            let artist = resultsDict["artistName"] as! String
                            let albumTitle = resultsDict["collectionName"] as! String
                            let title = resultsDict["trackName"] as! String
                            let artworkURL = resultsDict["artworkUrl100"] as! String
                            let album = Model(title: title, artist: artist, album: albumTitle, artworkURL: artworkURL)
                           // @escaping .completionHandler(album)
                        }
                         
                    }
                    }catch{
                        print("Error Stream Data \(error)")
                    }
                }
            }
    
        task.resume()
        }
    }

