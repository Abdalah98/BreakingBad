//
//  DetailsCollectionView+EXT.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/20/21.
//

import UIKit
extension DetailsVC : UICollectionViewDelegate , UICollectionViewDataSource{
     func configureCollection(){
        let nib = UINib(nibName: Constant.detailsCell, bundle: nil)
        appearanceCollectionView.register(nib, forCellWithReuseIdentifier: Constant.detailsCell)
        betterCallSaulAppearanceCollectioView.register(nib, forCellWithReuseIdentifier: Constant.detailsCell)

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == appearanceCollectionView {
            return character?.appearance?.count ?? 0
        }
        return character?.betterCallSaulAppearance?.count ?? 0

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == appearanceCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.detailsCell, for: indexPath) as! DetailsCell
            let count = character?.appearance?[indexPath.item]
            cell.countLabel.text = String(count ?? 0)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.detailsCell, for: indexPath) as! DetailsCell
        let count = character?.betterCallSaulAppearance?[indexPath.item]
        cell.countLabel.text = String(count ?? 0)
        return cell
    }
    

}
