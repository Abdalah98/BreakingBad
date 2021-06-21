//
//  DetailsEpisodeVC.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/21/21.
//

import UIKit

class DetailsEpisodeVC: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var seriesLabel: UILabel!
    @IBOutlet weak var charCollectionView: UICollectionView!
    var allEpisode:AllEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleLabel.text = allEpisode?.title
        dateLabel.text = allEpisode?.airDate
        episodeLabel.text = allEpisode?.episode
        seriesLabel.text = allEpisode?.series
        seasonLabel.text = allEpisode?.season
        
        charCollectionView.reloadData()
    }
}
extension DetailsEpisodeVC : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func configureCollection(){
        let nib = UINib(nibName: Constant.detailsCell, bundle: nil)
        charCollectionView.register(nib, forCellWithReuseIdentifier: Constant.detailsCell)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allEpisode?.characters?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.detailsCell, for: indexPath) as! DetailsCell
        let count = allEpisode?.characters?[indexPath.item]
        cell.countLabel.text = count
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
    
}
