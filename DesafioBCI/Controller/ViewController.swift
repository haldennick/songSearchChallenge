//
//  ViewController.swift
//  DesafioBCI
//
//  Created by Carlos Sepulveda on 23-02-20.
//  Copyright © 2020 Carlos Sepulveda. All rights reserved.
//

import UIKit
import ChameleonFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ItunesConnection.getAlbumForString(searchString: "Frozen") { (album:Model) in
            print(album.album!)
        }
        view.backgroundColor = GradientColor(UIGradientStyle.radial, frame: view.frame, colors: [FlatYellow(), FlatOrange()])
        }


}

