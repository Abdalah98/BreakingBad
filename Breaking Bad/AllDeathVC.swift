//
//  AllDeathVC.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/16/21.
//

import UIKit
import SideMenu
extension AllDeathVC {
    static func create() -> AllDeathVC {
        let view: AllDeathVC = UIStoryboard.instance(.death)
        view.modalPresentationStyle = .fullScreen
        return view
    }
}
class AllDeathVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var numberDeath: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewDesign()
        configureNIBCell()
    }
    
    
    var countDeath  = [DeathCountElement]()
    var allDeath    = [AllDeathElement]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    fectData()
    }
    private func fectData(){
        self.view.makeToastActivity(.center)
        NetworkManger.shared.getCountDeath { [weak self](num) in
            guard let self = self else{return}
            self.view.hideToastActivity()
            self.countDeath = num
            for i in  self.countDeath {
                self.numberDeath.text =  String(i.deathCount ?? 0)
            }
        }
        NetworkManger.shared.getAllIDeath { [weak self](all) in
            guard let self = self else{return}
            self.view.hideToastActivity()
            self.allDeath = all
            
                self.tableView.reloadData()
           
        }
    }
    @IBAction func sideMenuAction(_ sender: Any) {
        navigationController?.pushViewController(SideMenuVC.create(), animated: true)
        present(SideMenuManager.default.setSideMenuViewController(), animated: true)

    }
    @IBAction func seachAction(_ sender: Any) {
        navigationController?.pushViewController(SearchDeathVC.create(), animated: true)

    }
}

extension AllDeathVC : UITableViewDataSource , UITableViewDelegate{
 
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
        return 245
    }
    
}
