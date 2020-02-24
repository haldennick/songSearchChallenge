//
//  ViewController.swift
//  DesafioBCI
//
//  Created by Carlos Sepulveda on 23-02-20.
//  Copyright © 2020 Carlos Sepulveda. All rights reserved.
//

import UIKit
import ChameleonFramework

class SearchingSong: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    var albums = [Album]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        searchBar.delegate = (self as! UISearchBarDelegate)
//        collectionView.delegate = (self as! UICollectionViewDelegate)
//        collectionView.dataSource = (self as! UICollectionViewDataSource)
        
        if #available(iOS 11.0, *){
            navigationItem.largeTitleDisplayMode = .automatic
        }
        
        view.backgroundColor = GradientColor(UIGradientStyle.radial, frame: view.frame, colors: [FlatYellow(), FlatOrange()])
        
        let indentation = (self.view.bounds.size.width - 300) / 4
        collectionView.contentInset = UIEdgeInsets(top: indentation, left: indentation, bottom: indentation, right: indentation)
        searchBar.backgroundColor =  ContrastColorOf(FlatOrange(), returnFlat: true)
        }

}

extension SearchingSong: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCell", for: indexPath) as? AlbumCell{
            cell.updateCell(album: albums[indexPath.row])
            return cell
            
        }
        return UICollectionViewCell()
    }
    
    
}

