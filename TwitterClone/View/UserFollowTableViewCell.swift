//
//  UserFollowTableViewCell.swift
//  TwitterClone
//
//  Created by 이지원 on 2021/03/05.
//

import UIKit

class UserFollowTableViewCell: UITableViewCell {

    static let identifier = "userFollowCell"

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageView.layer.cornerRadius = imageView.frame.size.height * 0.5
        imageView.clipsToBounds = true
        imageView.backgroundColor = .darkGray
        return imageView
    }()

    private lazy var whoIsFollowingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.text = "xxx 님이 팔로우합니다"
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.textColor = .secondaryLabel
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()

    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.text = "Eric"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()

    private lazy var identifierLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.text = "@eric9"
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        return label
    }()

    private lazy var followButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("팔로우", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .callout)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = false
        return button
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.text = "Love iOS, Swift"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

// MARK: - Private
private extension UserFollowTableViewCell {
    func configureViews() {
        let userStack = UIStackView(arrangedSubviews: [usernameLabel, identifierLabel])
        userStack.translatesAutoresizingMaskIntoConstraints = false
        userStack.axis = .vertical
        userStack.alignment = .leading
        userStack.distribution = .equalSpacing
        userStack.spacing = 0

        let headlineView = UIView()
        headlineView.translatesAutoresizingMaskIntoConstraints = false
        headlineView.addSubview(userStack)
        headlineView.addSubview(followButton)

        NSLayoutConstraint.activate([
            userStack.leadingAnchor.constraint(equalTo: headlineView.leadingAnchor),
            userStack.topAnchor.constraint(equalTo: headlineView.topAnchor),
            userStack.bottomAnchor.constraint(equalTo: headlineView.bottomAnchor),
            followButton.topAnchor.constraint(equalTo: headlineView.topAnchor),
            followButton.trailingAnchor.constraint(equalTo: headlineView.trailingAnchor),
            followButton.bottomAnchor.constraint(equalTo: headlineView.bottomAnchor),
        ])

        let userStackTrailingConstraint = userStack.trailingAnchor.constraint(equalTo: followButton.leadingAnchor)
        userStackTrailingConstraint.priority = .defaultHigh
        userStackTrailingConstraint.isActive = true

        let infoStack = UIStackView(arrangedSubviews: [whoIsFollowingLabel, headlineView, descriptionLabel])
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        infoStack.axis = .vertical
        infoStack.alignment = .fill
        infoStack.distribution = .fill

        addSubview(profileImageView)
        addSubview(infoStack)

        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            profileImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 10),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor),
            infoStack.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            infoStack.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            infoStack.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            infoStack.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        ])
    }
}
