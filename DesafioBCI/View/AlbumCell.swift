//
//  AlbumCell.swift
//  DesafioBCI
//
//  Created by Carlos Sepulveda on 24-02-20.
//  Copyright © 2020 Carlos Sepulveda. All rights reserved.
//

import UIKit

class AlbumCell: UICollectionViewCell {
   
    @IBOutlet weak var albumImage: RoundedImageView!
    @IBOutlet weak var albumTitle: UILabel!
    
    @IBOutlet weak var artistName: UILabel!
    func updateCell (album: Album) {
        let imageUrl = URL(string: album.artworkUrl100)
        
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: imageUrl!) {
                DispatchQueue.main.async {
                    self.albumImage.image = UIImage(data: imageData)
                }
            }
        }
        
        albumTitle.text = album.collectionName
        artistName.text = album.artistName
    }
}
