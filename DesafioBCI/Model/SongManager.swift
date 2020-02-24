//
//  File.swift
//  DesafioBCI
//
//  Created by Carlos Sepulveda on 23-02-20.
//  Copyright © 2020 Carlos Sepulveda. All rights reserved.
//

import Foundation

protocol MusicManagerDelegate {
   // func didSearchSong(_ songManager: SongManager)
}

struct SongManager{
    let songURL = "https://itunes.apple.com/search?term="
    
    func fetchSong(songName: String){
            let urlString = "\(songURL)\(songName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        //1. Create URL
        if let url = URL(string: urlString){
            //2.Create URLSession
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data{
                    if let song = self.parseJSON(safeData){
                        //self.delegate?.didUpdateSong
                    }
                }
            }
        }
    }
    
    
}


//let task = session.dataTask(with: url) { (data, response, error) in
//               if error != nil {
//                   self.delegate?.didFailWithError(error: error!)
//                   return
//               }
//               if let safeData = data{
//                   if let weather =  self.parseJSON(safeData){
//                       self.delegate?.didUpdateWeather(self, weather: weather)
//                   }
//
//               }
 //          }
