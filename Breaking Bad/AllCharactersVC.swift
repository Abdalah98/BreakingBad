//
//  AllCharactersVC.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/20/21.
//

import UIKit
import SDWebImage
extension AllCharactersVC {
    static func create() -> AllCharactersVC {
        let view: AllCharactersVC = UIStoryboard.instance(.characters)
        view.modalPresentationStyle = .fullScreen
        return view
    }
}
class AllCharactersVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNIBCell()
        tableViewDesign()

    }
    var charactersName = [CharactersNameElement]()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.makeToastActivity(.center)
        NetworkManger.shared.getAllCharacters { [weak self](data) in
            guard let self = self else {return}
            self.view.hideToastActivity()
            self.charactersName = data
            self.tableView.reloadData()
        }

    }

}
