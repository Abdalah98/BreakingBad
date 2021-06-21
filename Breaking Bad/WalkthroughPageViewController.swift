//
//  WalkthroughPageViewController.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/20/21.
//

import UIKit

class WalkthroughPageViewController: UIPageViewController,UIPageViewControllerDataSource {

    var pageImages = ["image2", "image1", "iamge3"]
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

       
            dataSource = self

            // Create the first walkthrough screen
            if let startingViewController = contentViewController(at: 0) {
                setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
            }    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        var index = (viewController as! WalkthroughContentViewController).index
        index -= 1

        return contentViewController(at: index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        var index = (viewController as! WalkthroughContentViewController).index
        index += 1

        return contentViewController(at: index)}
    
    func contentViewController(at index: Int) -> WalkthroughContentViewController? {
        if index < 0 || index >= pageImages.count {
            return nil
        }

        // Create a new view controller and pass suitable data.
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughContentViewController") as? WalkthroughContentViewController {

            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.index = index

            return pageContentViewController
        }

        return nil
    }

}
