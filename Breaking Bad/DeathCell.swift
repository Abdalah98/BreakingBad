//
//  DeathCell.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/16/21.
//

import UIKit

class DeathCell: UITableViewCell {

    @IBOutlet weak var death: UILabel!
    @IBOutlet weak var cause: UILabel!
    @IBOutlet weak var lastWords: UILabel!
    @IBOutlet weak var nambe: UILabel!
    @IBOutlet weak var season: UILabel!
    @IBOutlet weak var episode: UILabel!
    
    var allData: AllDeathElement?{
        didSet{
            death.text = allData?.death
            cause.text = allData?.cause
            lastWords.text = allData?.lastWords
            nambe.text = String(allData?.numberOfDeaths ?? 0)
            season.text = String(allData?.season ?? 0 )
            episode.text = String(allData?.episode ?? 0 )
            
        }
    }
    
    
    override func layoutSubviews() {
          super.layoutSubviews()
          contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom:5, right: 10))
        
      }
   
    
}
