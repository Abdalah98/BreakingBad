//
//  SideMenuVC.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/15/21.
//

import UIKit
import SideMenu
import SafariServices

extension SideMenuVC {
    static func create() -> SideMenuVC {
        let view: SideMenuVC = UIStoryboard.instance(.main)
        view.modalPresentationStyle = .fullScreen
        return view
    }
}
class SideMenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    @IBAction func allCharactersAction(_ sender: Any) {
        navigationController?.pushViewController(AllCharactersVC.create(), animated: true)

        
    }
    @IBAction func allDeath(_ sender: Any) {
        navigationController?.pushViewController(AllDeathVC.create(), animated: true)
    }
    @IBAction func allEpisode(_ sender: Any) {
        navigationController?.pushViewController(AllEpisodeVC.create(), animated: true)
    }
    
    @IBAction func infoAction(_ sender: Any) {
        guard  let url = URL(string: "https://breakingbadapi.com/documentation") else{return}
           presntSafariVC( with: url )
     }
     
     func presntSafariVC(with url: URL){
         let safariVC = SFSafariViewController(url: url )
         self.present(safariVC, animated: true)

     }
    
}
