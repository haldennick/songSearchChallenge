//
//  Model.swift
//  DesafioBCI
//
//  Created by Carlos Sepulveda on 24-02-20.
//  Copyright © 2020 Carlos Sepulveda. All rights reserved.
//

import UIKit

class Model: NSObject {
    var title:String!
    var album:String!
    var artist:String!
    var artworkURL:String!
    
    init(title:String, artist:String, album:String, artworkURL:String){
        super.init()
        self.title = title
        self.artist = artist
        self.album = album
        self.artworkURL = artworkURL
        
    }
}
