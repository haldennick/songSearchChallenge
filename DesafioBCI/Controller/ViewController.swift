//
//  ViewController.swift
//  DesafioBCI
//
//  Created by Carlos Sepulveda on 23-02-20.
//  Copyright © 2020 Carlos Sepulveda. All rights reserved.
//

import UIKit
import ChameleonFramework
import FAPaginationLayout
class SearchingSong: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    var albums = [Album]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if #available(iOS 11.0, *){
            navigationItem.largeTitleDisplayMode = .automatic
        }
        
        view.backgroundColor = GradientColor(UIGradientStyle.radial, frame: view.frame, colors: [FlatYellow(), FlatOrange()])
        
        let indentation = (self.view.bounds.size.width - 300) / 4
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        
        searchBar.backgroundColor =  ContrastColorOf(FlatOrange(), returnFlat: true)
        }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateCellsLayout()
    }

    func updateCellsLayout()  {

        let centerX = collectionView.contentOffset.x + (collectionView.frame.size.width)/2

        for cell in collectionView.visibleCells {

            var offsetX = centerX - cell.center.x
            if offsetX < 0 {
                offsetX *= -1
            }

            if offsetX > 0 {

                let offsetPercentage = offsetX / view.bounds.width
                let rotation = 1 - offsetPercentage
                cell.transform = CGAffineTransform(rotationAngle: rotation - 45)
            }
        }
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        var cellSize: CGSize = collectionView.bounds.size

        cellSize.width -= collectionView.contentInset.left * 2
        cellSize.width -= collectionView.contentInset.right * 2
        cellSize.height = cellSize.width

        return cellSize
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateCellsLayout()
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("Do nothing")
    }
    
}

extension SearchingSong: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text != nil || searchBar.text != "" {
            ConnectionService.instance.getAlbums(searchRequest: searchBar.text!) { (requestedAlbums) in
                self.albums = requestedAlbums.sorted(by: {$0.collectionName < $1.collectionName})
                DispatchQueue.main.async {
                self.collectionView.reloadData()
                }
            }
        }
        searchBar.resignFirstResponder()
    }
}
