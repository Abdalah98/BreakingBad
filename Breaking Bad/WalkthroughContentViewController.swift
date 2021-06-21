//
//  WalkthroughContentViewController.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/20/21.
//

import UIKit

class WalkthroughContentViewController: UIViewController {

   
    @IBOutlet var contentImageView: UIImageView!

    var index = 0
    var imageFile = ""
   override func viewDidLoad() {
        super.viewDidLoad()

        contentImageView.image = UIImage(named: imageFile)
    }
}
