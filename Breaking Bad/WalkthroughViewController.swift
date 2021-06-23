//
//  WalkthroughViewController.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/20/21.
//

import UIKit

class WalkthroughViewController: UIViewController ,WalkthroughPageViewControllerDelegate{
  @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var skipButton: UIButton!
    
    var walkthroughPageViewController: WalkthroughPageViewController?
  
    @IBAction func skipButtonTapped(sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
            dismiss(animated: true, completion: nil)  }
   @IBAction func nextButtonTapped(sender: UIButton) {
      if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...2:
                walkthroughPageViewController?.forwardPage()

            case 3:
                UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
                dismiss(animated: true, completion: nil)

            default: break

            }
        }

        updateUI()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? WalkthroughPageViewController {
            walkthroughPageViewController = pageViewController
            walkthroughPageViewController?.walkthroughDelegate = self
        }
    }
    func updateUI() {

        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...2:
                nextButton.setTitle("NEXT", for: .normal)
                skipButton.isHidden = false
            case 3:
                nextButton.setTitle("GET STARTED", for: .normal)
                skipButton.isHidden = true
            default: break
            }

            pageControl.currentPage = index
        }

    }
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
    }
