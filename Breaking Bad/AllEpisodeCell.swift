//
//  AllEpisodeCell.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/21/21.
//

import UIKit

class AllEpisodeCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    override func layoutSubviews() {
          super.layoutSubviews()
          contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom:5, right: 10))
      }

  
}
