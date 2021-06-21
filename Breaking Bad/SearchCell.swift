//
//  SearchCell.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/16/21.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var imageSearch: UIImageView!
    @IBOutlet weak var name: UILabel!
    override func layoutSubviews() {
          super.layoutSubviews()
          contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom:5, right: 10))
      }
   
    
}
