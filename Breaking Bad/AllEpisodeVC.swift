//
//  AllEpisodeVC.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/21/21.
//

import UIKit
extension AllEpisodeVC {
    static func create() -> AllEpisodeVC {
        let view: AllEpisodeVC = UIStoryboard.instance(.episode)
        view.modalPresentationStyle = .fullScreen
        return view
    }
}
class AllEpisodeVC: UIViewController {

    @IBOutlet weak var AllEpisodeTableView: UITableView!
    var allEpisode = [AllEpisode]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNIBCell()
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableViewDesign()
        
        NetworkManger.shared.getAllEpisode { (episode) in
            self.allEpisode = episode
            self.AllEpisodeTableView.reloadData()
        }
    }
    func configureNIBCell(){
        let nib = UINib(nibName: Constant.allEpisodeCell, bundle: nil)
        AllEpisodeTableView.register(nib, forCellReuseIdentifier: Constant.allEpisodeCell)
    }
    func tableViewDesign(){
      
        AllEpisodeTableView.tableFooterView = UIView()
        AllEpisodeTableView.separatorStyle = .none
    }
    @IBAction func seachAction(_ sender: Any) {
        navigationController?.pushViewController(SearchEpisodeVC.create(), animated: true)

    }
}
extension AllEpisodeVC : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allEpisode.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.allEpisodeCell) as! AllEpisodeCell
        let episode = allEpisode[indexPath.row]
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
                   if let indexPath = AllEpisodeTableView.indexPathForSelectedRow {
                       episodeController.allEpisode = allEpisode[indexPath.row]
                   }else{
                     return print("error")
                 }
               }
           }
    
}
