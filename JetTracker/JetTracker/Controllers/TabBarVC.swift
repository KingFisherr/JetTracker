//
//  TabBarVC.swift
//  JetTracker
//
//  Created by Tahsin Provath on 3/2/23.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
        // Do any additional setup after loading the view.
    }
    

    func setupVCs() {
          viewControllers = [
              createNavController(for: FlightMapVC(), title: NSLocalizedString("Map", comment: ""), image: UIImage(systemName: "magnifyingglass")!),
              createNavController(for: ViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house")!),
              createNavController(for: SavedFlightVC(), title: NSLocalizedString("Saved Flight", comment: ""), image: UIImage(systemName: "square.and.arrow.down.fill")!)
          ]
      }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                    title: String,
                                                    image: UIImage) -> UIViewController {
          let navController = UINavigationController(rootViewController: rootViewController)
          navController.tabBarItem.title = title
          navController.tabBarItem.image = image
          navController.navigationBar.prefersLargeTitles = true
          //rootViewController.navigationItem.title = title
          return navController
      }

}
