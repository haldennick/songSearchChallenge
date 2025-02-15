//
//  ItunesConnection.swift
//  DesafioBCI
//
//  Created by Carlos Sepulveda on 24-02-20.
//  Copyright © 2020 Carlos Sepulveda. All rights reserved.
//

import Foundation

let BASE_URL = "https://itunes.apple.com/search?entity=album&attribute=albumTerm&offset=0&limit=20&term="
let ALBUM_SONGS_URL = "https://itunes.apple.com/lookup?entity=song&id="

class ConnectionService {
    
    static let instance = ConnectionService()
    
    func getAlbums (searchRequest: String, complition: @escaping ([Album])->()) {
        var albums = [Album]()
        let searchString = searchRequest.replacingOccurrences(of: " ", with: "+")
        let url = URL(string: "\(BASE_URL)\(searchString)")
        let session = URLSession.shared
        session.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    if let albumsResults = json["results"] as? NSArray {
                        for album in albumsResults {
                            if let albumInfo = album as? [String: AnyObject] {
                                guard let artistName = albumInfo["artistName"] as? String else {return}
                                guard let artworkUrl100 = albumInfo["artworkUrl100"] as? String else {return}
                                guard let collectionId = albumInfo["collectionId"] as? Int else {return}
                                guard let collectionName = albumInfo["collectionName"] as? String else {return}
                                guard let releaseDate = albumInfo["releaseDate"] as? String else {return}
                                let releaseDateFormatted = releaseDate.prefix(4)
                                let albumInstance = Album(artistName: artistName, artworkUrl100: artworkUrl100, collectionId: collectionId, collectionName: collectionName, releaseDate: String(releaseDateFormatted))
                                albums.append(albumInstance)
                            }
                        }
                        complition(albums)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            if error != nil {
                print(error!.localizedDescription)
            }
        }.resume()
    }
    
//    func getAlbumTracks (collectionId: Int, complition: @escaping ([Track]) -> ()) {
//        var tracks = [Track]()
//        let url = URL(string: "\(ALBUM_SONGS_URL)\(collectionId)")
//        let session = URLSession.shared
//        session.dataTask(with: url!) { (data, response, error) in
//            if let data = data {
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//                    if let trackResults = json["results"] as? NSArray {
//                        for song in trackResults {
//                            // 0 element is album info
//                            if trackResults.index(of: song) != 0 {
//                                if let songInfo = song as? [String: AnyObject] {
//                                    guard let trackName = songInfo["trackName"] as? String else {return}
//                                    guard let trackNumber = songInfo["trackNumber"] as? Int else {return}
//                                    let track = Track(trackName: trackName, trackNumber: trackNumber)
//                                    tracks.append(track)
//                                }
//                            }
//                        }
//                        complition(tracks)
//                    }
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//            if error != nil {
//                print(error!.localizedDescription)
//            }
//        }.resume()
//    }
    
}
