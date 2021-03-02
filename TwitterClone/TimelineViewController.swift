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

        self.tabBarController?.navigationItem.titleView = UIImageView(image: UIImage(systemName: "cloud.bolt.fill"))
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"),
                                                                                  style: .plain,
                                                                                  target: self,
                                                                                  action: nil)
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "sparkles"),
                                                                                   style: .plain,
                                                                                   target: self,
                                                                                   action: nil)

        collectionView.backgroundColor = .white
        collectionView.register(TweetCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
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
