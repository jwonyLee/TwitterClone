//
//  TweetCollectionViewCell.swift
//  TwitterClone
//
//  Created by 이지원 on 2021/03/02.
//

import UIKit

class TweetCollectionViewCell: UICollectionViewCell {

    static let identifier = "cell"

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person")
        imageView.backgroundColor = .gray
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        return imageView
    }()

    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.text = "username"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textAlignment = .left
        return label
    }()

    private lazy var identifierLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.text = "@username"
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        label.textAlignment = .left
        return label
    }()

    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.text = "5일 전"
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        label.textAlignment = .left
        return label
    }()

    private lazy var detailButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.init(systemName: "ellipsis"), for: .normal)
        button.tintColor = .secondaryLabel
        return button
    }()

    private lazy var contentTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        label.numberOfLines = 7
        label.textAlignment = .left
        return label
    }()

    private lazy var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        return imageView
    }()

    private lazy var mentionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setImage(UIImage(systemName: "bubble.left"), for: .normal)
        button.tintColor = .secondaryLabel
        button.setTitle("5", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        button.semanticContentAttribute = .forceLeftToRight
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .leading
        return button
    }()

    private lazy var retweetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setImage(UIImage(systemName: "arrow.2.squarepath"), for: .normal)
        button.tintColor = .secondaryLabel
        button.setTitle("3,884", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        button.semanticContentAttribute = .forceLeftToRight
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .leading
        return button
    }()

    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .secondaryLabel
        button.setTitle("767", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        button.semanticContentAttribute = .forceLeftToRight
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .leading
        return button
    }()

    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .secondaryLabel
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .leading
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not beem implemented")
    }
}

// MARK: - Private
private extension TweetCollectionViewCell {
    func configureViews() {
        let userInfoStack = UIStackView(arrangedSubviews: [usernameLabel, identifierLabel, timeLabel])
        userInfoStack.translatesAutoresizingMaskIntoConstraints = false
        userInfoStack.axis = .horizontal
        userInfoStack.spacing = UIStackView.spacingUseSystem
        userInfoStack.alignment = .fill
        userInfoStack.distribution = .fill

        let headlineView = UIView()
        headlineView.translatesAutoresizingMaskIntoConstraints = false
        headlineView.addSubview(userInfoStack)
        headlineView.addSubview(detailButton)

        let buttonStack = UIStackView(arrangedSubviews: [mentionButton, retweetButton, heartButton, shareButton])
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.axis = .horizontal
        buttonStack.spacing = UIStackView.spacingUseSystem
        buttonStack.alignment = .leading
        buttonStack.distribution = .fillEqually

        let containerStack = UIStackView(arrangedSubviews: [headlineView, contentTextLabel, contentImageView, buttonStack])
        containerStack.translatesAutoresizingMaskIntoConstraints = false
        containerStack.axis = .vertical
        containerStack.spacing = 0
        containerStack.alignment = .fill
        containerStack.distribution = .fill

        addSubview(profileImageView)
        addSubview(containerStack)

        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            profileImageView.trailingAnchor.constraint(equalTo: containerStack.leadingAnchor, constant: -10),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            containerStack.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            containerStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])

        NSLayoutConstraint.activate([
            userInfoStack.leadingAnchor.constraint(equalTo: headlineView.leadingAnchor),
            userInfoStack.topAnchor.constraint(equalTo: headlineView.topAnchor),
            userInfoStack.bottomAnchor.constraint(equalTo: headlineView.bottomAnchor),
            detailButton.topAnchor.constraint(equalTo: headlineView.topAnchor),
            detailButton.trailingAnchor.constraint(equalTo: headlineView.trailingAnchor),
            detailButton.bottomAnchor.constraint(equalTo: headlineView.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            contentImageView.widthAnchor.constraint(equalTo: contentImageView.heightAnchor, multiplier: 2)
        ])
    }
}
