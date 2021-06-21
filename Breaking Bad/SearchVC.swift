//
//  SearchVC.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/16/21.
//

import UIKit
import SDWebImage
extension SearchVC {
    static func create() -> SearchVC {
        let view: SearchVC = UIStoryboard.instance(.search)
        view.modalPresentationStyle = .fullScreen
        return view
    }
}
class SearchVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController()
    var charactersName = [CharactersNameElement]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.allowsSelection = true
        tableViewDesign()
        configureNIBCell()
        configureSearch()
    }
    
    fileprivate func configureSearch() {
        searchController.searchBar.placeholder = "Search Here"
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        self.view.hideToastActivity()

    }


}


extension SearchVC :UISearchBarDelegate, UISearchControllerDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.view.makeToastActivity(.center)
    NetworkManger.shared.getsearchResultsFromCharacter(sreachText: searchText) { [weak self](data) in
        guard let self = self else{return}
        self.view.hideToastActivity()
            self.charactersName = data
        self.tableView.reloadData()
        }

    }
    
}
