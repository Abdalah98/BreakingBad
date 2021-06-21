//
//  PopUpQouteVC.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/15/21.
//

import UIKit

class PopUpQouteVC: UIViewController {
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var seriesLabel: UILabel!
    var randomQouteData : RandomQouteData?
    var quote : String?
    var author : String?
    var series : String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        quoteLabel.text = quote
        seriesLabel.text = series
        authorLabel.text = author
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        self.showAnimate()
    }
    
    @IBAction func closePopUp(_ sender: AnyObject) {
        self.removeAnimate()
        
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    
}
/* **/
