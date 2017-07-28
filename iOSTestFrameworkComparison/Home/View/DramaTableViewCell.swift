//
//  DramaTableViewCell.swift
//  iOSTestFrameworkComparison
//
//  Created by Shunya Yamashita on 2017/07/27.
//  Copyright © 2017年 shymst. All rights reserved.
//

import UIKit

class DramaTableViewCell: UITableViewCell {

    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.darkGray
        return label
    }()

    let seasonCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.gray
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }

    private func setupUI() {
        addSubview(thumbnailImageView)
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        thumbnailImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/6).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        thumbnailImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true

        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

        addSubview(seasonCountLabel)
        seasonCountLabel.translatesAutoresizingMaskIntoConstraints = false
        seasonCountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2).isActive = true
        seasonCountLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 10).isActive = true
        seasonCountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }

    func setData(_ drama: DramaModel) {
        thumbnailImageView.image = nil

        DispatchQueue.global(qos: .default).async {
            _ = URLSession.shared.dataTask(with: drama.imageURL) { [weak self] data, _, error in
                if let error = error {
                    print(error)
                }

                DispatchQueue.main.async {
                    self?.thumbnailImageView.image = UIImage(data: data!)
                }
            }.resume()
        }

        titleLabel.text = drama.title
        seasonCountLabel.text = "\(drama.seasonCount) seasons"
    }
}
