//
//  MusicData.swift
//  DesafioBCI
//
//  Created by Carlos Sepulveda on 24-02-20.
//  Copyright © 2020 Carlos Sepulveda. All rights reserved.
//

import UIKit

class Album {
    let artistName: String
    var artworkUrl100: String
    let collectionId: Int
    let collectionName: String
    let releaseDate: String
        
    init(artistName: String, artworkUrl100: String, collectionId: Int, collectionName: String, releaseDate: String){
        self.artistName = artistName
        self.artworkUrl100 = artworkUrl100
        self.collectionId = collectionId
        self.collectionName = collectionName
        self.releaseDate = releaseDate
    }
}
