//
//  ImageBannerTableViewCell.swift
//  TwitterClone
//
//  Created by 이지원 on 2021/03/04.
//

import UIKit

class ImageBannerTableViewCell: UITableViewCell {

    static let identifier = "imageBannerCell"

    private lazy var bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var imageTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.text = "테스트 이미지"
        label.font = UIFont.preferredFont(forTextStyle: .title2)
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
        bannerImageView.addSubview(imageTitleLabel)
        addSubview(bannerImageView)

        NSLayoutConstraint.activate([
            imageTitleLabel.leadingAnchor.constraint(equalTo: bannerImageView.leadingAnchor, constant: 10),
            imageTitleLabel.bottomAnchor.constraint(equalTo: bannerImageView.bottomAnchor, constant: -10)
        ])

        NSLayoutConstraint.activate([
            bannerImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bannerImageView.topAnchor.constraint(equalTo: self.topAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}
