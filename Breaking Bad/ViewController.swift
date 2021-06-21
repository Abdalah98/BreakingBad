//
//  ViewController.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/14/21.
//

import UIKit
import SideMenu
class ViewController: UIViewController {
 var randomQuote = [RandomQouteData]()
    var window: UIWindow?
//    override func viewDidAppear(_ animated: Bool) {
//        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
//        if let walkthroughViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughViewController") as? WalkthroughViewController {
//
//            present(walkthroughViewController, animated: true, completion: nil)
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.hideToastActivity()

       // fetchData()
    }
    func fetchData(){
        self.view.makeToastActivity(.center)
        imageNavigationItem()
        NetworkManger.shared.getAllIRandomQuote {[weak self] (qoute) in
            guard let self = self else{return}
            self.view.hideToastActivity()
            self.randomQuote = qoute
        }
    }

    func imageNavigationItem(){
        let logo = UIImage(named: "Breaking_Bad_512x512_36554")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
    }
    
    
    @IBAction func showMenuAction(_ sender: Any) {
        let menu = SideMenuNavigationController(rootViewController: SideMenuVC())
        present(menu, animated: true, completion: nil)
    }
    
    
    
    @IBAction func randomQouteAction(_ sender: Any) {
        fetchData()
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUpQouteVC") as! PopUpQouteVC
        for i in randomQuote {
             popOverVC.author = i.author
              popOverVC.quote = i.quote
              popOverVC.series = i.series
        }

        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
    @IBAction func searchAction(_ sender: Any) {
        navigationController?.pushViewController(SearchVC.create(), animated: true)
    }



}



