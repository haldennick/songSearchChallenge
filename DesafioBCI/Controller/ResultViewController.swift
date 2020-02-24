//
//  ResultViewController.swift
//  DesafioBCI
//
//  Created by Carlos Sepulveda on 23-02-20.
//  Copyright © 2020 Carlos Sepulveda. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let album = "Los palitroques"
        
        songNameLabel.text = album
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
