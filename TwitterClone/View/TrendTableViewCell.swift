//
//  TrendTableViewCell.swift
//  TwitterClone
//
//  Created by 이지원 on 2021/03/05.
//

import UIKit

class TrendTableViewCell: UITableViewCell {

    static let identifier = "trendCell"

    private lazy var rankLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.text = "대한민국에서 트렌드 중"
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()

    private lazy var keywordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.text = "테스트 이미지"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()

    private lazy var tweetCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.text = "2,905 트윗"
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
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

    private func configureViews() {
        let trendStack = UIStackView(arrangedSubviews: [rankLabel, keywordLabel, tweetCountLabel])
        trendStack.translatesAutoresizingMaskIntoConstraints = false
        trendStack.axis = .vertical
        trendStack.alignment = .fill
        trendStack.distribution = .fill

        addSubview(trendStack)
        let optionImageView = UIImageView(image: UIImage(systemName: "ellipsis"))
        optionImageView.tintColor = .secondaryLabel
        accessoryView = optionImageView

        NSLayoutConstraint.activate([
            trendStack.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            trendStack.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            trendStack.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            trendStack.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        ])
    }
}
