//
//  DetailsVC.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/20/21.
//

import UIKit
import SDWebImage
class DetailsVC: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var birthday: UILabel!

    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var portrayed: UILabel!
    @IBOutlet weak var category: UILabel!
    
 
    @IBOutlet weak var appearanceCollectionView: UICollectionView!
    @IBOutlet weak var betterCallSaulAppearanceCollectioView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
        
    }

    //var  charactersName = [CharactersNameElement]()
    var character :CharactersNameElement?{
        didSet{
            navigationItem.title = character?.name

        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        image.sd_setImage(with:URL(string: character?.img ?? ""))
        name.text = character?.name
        birthday.text = character?.birthday
        status.text = character?.status
        nickName.text = character?.nickname
        portrayed.text = character?.portrayed
        appearanceCollectionView.reloadData()
        betterCallSaulAppearanceCollectioView.reloadData()
    }
    
    
}
