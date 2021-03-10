//
//  TimelineViewController.swift
//  TwitterClone
//
//  Created by 이지원 on 2021/03/01.
//

import UIKit

class TimelineViewController: UICollectionViewController {

    private lazy var tweetFloatingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "pencil.tip"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        button.layer.shadowRadius = 1.0
        button.layer.shadowOpacity = 0.5
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigation()
        configureTweetButton()

        collectionView.backgroundColor = .white
        collectionView.register(TweetCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }

    @objc func scrollToTop(_ sender: UIButton) {
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
}

// MARK: - Public: Delegate
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

// MARK: - Private
private extension TimelineViewController {
    func configureNavigation() {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "cloud.bolt.fill"), for: .normal)
        button.addTarget(self, action: #selector(scrollToTop(_:)), for: .touchUpInside)
        self.navigationItem.titleView = button
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"),
                                                                                  style: .plain,
                                                                                  target: self,
                                                                                  action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "sparkles"),
                                                                                   style: .plain,
                                                                                   target: self,
                                                                                   action: nil)
    }

    func configureTweetButton() {
        view.addSubview(tweetFloatingButton)

        NSLayoutConstraint.activate([
            tweetFloatingButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            tweetFloatingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            tweetFloatingButton.widthAnchor.constraint(equalToConstant: 50),
            tweetFloatingButton.heightAnchor.constraint(equalTo: tweetFloatingButton.widthAnchor)
        ])
    }
}
