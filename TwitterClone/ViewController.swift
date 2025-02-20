//
//  ViewController.swift
//  TwitterClone
//
//  Created by 이지원 on 2021/03/02.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        let timelineViewController = UINavigationController(rootViewController: TimelineViewController(collectionViewLayout: layout))
        timelineViewController.tabBarItem = UITabBarItem(title: "",
                                                         image: UIImage(systemName: "house"),
                                                         selectedImage: UIImage(systemName: "house.fill"))
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        searchViewController.tabBarItem = UITabBarItem(title: "",
                                                         image: UIImage(systemName: "magnifyingglass"),
                                                         selectedImage: UIImage(systemName: "magnifyingglass"))
        let tabBars = [timelineViewController, searchViewController]

        viewControllers = tabBars
    }
}
