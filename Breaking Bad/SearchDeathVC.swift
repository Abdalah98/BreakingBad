//
//  SearchDeathVC.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/21/21.
//

import UIKit
extension SearchDeathVC {
    static func create() -> SearchDeathVC {
        let view: SearchDeathVC = UIStoryboard.instance(.searchDeath)
        view.modalPresentationStyle = .fullScreen
        return view
    }
}
class SearchDeathVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController()
    var allDeath    = [AllDeathElement]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.hideToastActivity()
        configureSearch()
        configureNIBCell()
        tableViewDesign()
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
extension SearchDeathVC : UITableViewDataSource , UITableViewDelegate{
 
    func configureNIBCell(){
        let nib = UINib(nibName: Constant.deathCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Constant.deathCell)
    }
    fileprivate func tableViewDesign() {
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    

   
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allDeath.count
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.deathCell) as! DeathCell
        let allData = allDeath[indexPath.row]
        cell.allData = allData
        return cell
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}
extension SearchDeathVC :UISearchBarDelegate, UISearchControllerDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.view.makeToastActivity(.center)
        NetworkManger.shared.searchAllIDeath(sreachText: searchText) { [weak self](data) in
            guard let self = self else{return}
            self.view.hideToastActivity()
            self.allDeath = data
            self.tableView.reloadData()
        }
        
    }
    
    
}
