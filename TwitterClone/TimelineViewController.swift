//
//  TimelineViewController.swift
//  TwitterClone
//
//  Created by 이지원 on 2021/03/01.
//

import UIKit

class TimelineViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigation()

        collectionView.backgroundColor = .white
        collectionView.register(TweetCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }

    private func configureNavigation() {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "cloud.bolt.fill"), for: .normal)
        button.addTarget(self, action: #selector(scrollToTop(_:)), for: .touchUpInside)
        self.tabBarController?.navigationItem.titleView = button
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"),
                                                                                  style: .plain,
                                                                                  target: self,
                                                                                  action: nil)
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "sparkles"),
                                                                                   style: .plain,
                                                                                   target: self,
                                                                                   action: nil)

    }

    @objc func scrollToTop(_ sender: UIButton) {
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
}

extension TimelineViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        return cell
    }
}

extension TimelineViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: view.frame.width, height: 300)
    }
}
