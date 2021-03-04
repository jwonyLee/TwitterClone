//
//  SearchViewController.swift
//  TwitterClone
//
//  Created by 이지원 on 2021/03/04.
//

import UIKit

class SearchViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigation()
    }
    
    private func configureNavigation() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Tweet"
        navigationItem.titleView = searchController.searchBar
        definesPresentationContext = true

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"),
                                                                style: .plain,
                                                                target: self,
                                                                action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape"),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: nil)
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}
