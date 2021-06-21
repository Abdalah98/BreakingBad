//
//  SearchEpisodeVC.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/21/21.
//

import UIKit
extension SearchEpisodeVC {
    static func create() -> SearchEpisodeVC {
        let view: SearchEpisodeVC = UIStoryboard.instance(.searchEpisode)
        view.modalPresentationStyle = .fullScreen
        return view
    }
}

class SearchEpisodeVC: UIViewController {
    
    @IBOutlet weak var searchEpisode: UITableView!
    var searchEpisodearray = [AllEpisode]()
    let searchController = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNIBCell()
        tableViewDesign()
        configureSearch()
        self.view.hideToastActivity()
        
    }
    fileprivate func configureSearch() {
        
        searchController.searchBar.placeholder = "Search Here"
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        self.view.hideToastActivity()
        
    }
    func configureNIBCell(){
        let nib = UINib(nibName: Constant.allEpisodeCell, bundle: nil)
        searchEpisode.register(nib, forCellReuseIdentifier: Constant.allEpisodeCell)
    }
    func tableViewDesign(){
        
        searchEpisode.tableFooterView = UIView()
        searchEpisode.separatorStyle = .none
    }
}
extension SearchEpisodeVC : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchEpisodearray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.allEpisodeCell) as! AllEpisodeCell
        let episode = searchEpisodearray[indexPath.row]
        cell.episodeLabel.text =  episode.episode
        cell.seasonLabel.text  = episode.season
        cell.titleLabel.text  = episode.title
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constant.detailsEpisode, sender: self)
        
    }
    
    //MARK: - prepareSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constant.detailsEpisode {
            let episodeController = segue.destination as! DetailsEpisodeVC
            if let indexPath = searchEpisode.indexPathForSelectedRow {
                episodeController.allEpisode = searchEpisodearray[indexPath.row]
            }else{
                return print("error")
            }
        }
    }
    
}


extension SearchEpisodeVC :UISearchBarDelegate, UISearchControllerDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.view.makeToastActivity(.center)
        NetworkManger.shared.searchAllEpisode(searchText: searchText) { [weak self](data) in
            guard let self = self else{return}
            self.view.hideToastActivity()
            self.searchEpisodearray = data
            self.searchEpisode.reloadData()
        }
        
    }
    
    
}
