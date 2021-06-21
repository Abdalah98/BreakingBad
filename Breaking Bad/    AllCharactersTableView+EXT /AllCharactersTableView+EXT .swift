//
//  AllCharactersTableView+EXT .swift
//  Breaking Bad
//
//  Created by Abdallah on 6/20/21.
//

import UIKit
import SDWebImage
extension AllCharactersVC : UITableViewDataSource , UITableViewDelegate{
 
    func configureNIBCell(){
        let nib = UINib(nibName: Constant.searchCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Constant.searchCell)
    }
     func tableViewDesign() {
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    

   
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return charactersName.count
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.searchCell) as! SearchCell
        let data = charactersName[indexPath.row]
        cell.name.text = data.name
        cell.imageSearch.sd_setImage(with: URL(string:data.img ?? ""))
        return cell
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      performSegue(withIdentifier: Constant.showDetails, sender: self)

    }
    
    //MARK: - prepareSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == Constant.showDetails {
                    let episodeController = segue.destination as! DetailsVC


                    if let indexPath = tableView.indexPathForSelectedRow {
                        episodeController.character = charactersName[indexPath.row]
                    }else{
                      return print("error")
                  }
                }
            }
    
}
