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
        configureTableView()
    }
}

// MARK: - Public: Delegate
extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}

extension SearchViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 3
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return tableView.contentSize.width * 0.5
        }

        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "나를 위한 트렌드"
        } else if section == 2 {
            return "팔로우 추천"
        }
        return nil
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageBannerTableViewCell.identifier, for: indexPath)

            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TrendTableViewCell.identifier, for: indexPath)

            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: UserFollowTableViewCell.identifier, for: indexPath)

            return cell
        default:
            return tableView.dequeueReusableCell(withIdentifier: TrendTableViewCell.identifier, for: indexPath)
        }
    }
}

// MARK: - Private
private extension SearchViewController {
    func configureTableView() {
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(ImageBannerTableViewCell.self, forCellReuseIdentifier: ImageBannerTableViewCell.identifier)
        tableView.register(TrendTableViewCell.self, forCellReuseIdentifier: TrendTableViewCell.identifier)
        tableView.register(UserFollowTableViewCell.self, forCellReuseIdentifier: UserFollowTableViewCell.identifier)
    }

    func configureNavigation() {
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
