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

    let slider: UISlider = {
        let slider = UISlider()
        return slider
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

        thumbnailImageView.layer.shadowOffset = CGSize.zero
        thumbnailImageView.layer.shadowColor = UIColor.black.cgColor
        thumbnailImageView.layer.shadowOpacity = 0.2
        thumbnailImageView.layer.shadowPath = UIBezierPath(rect: thumbnailImageView.bounds).cgPath
        thumbnailImageView.layer.masksToBounds = false

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

        addSubview(slider)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 10).isActive = true
        slider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        slider.bottomAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor).isActive = true
    }

    func setData(_ drama: DramaModel) {
        titleLabel.text = drama.title
        seasonCountLabel.text = "\(drama.seasonCount) \(drama.seasonCount == 1 ? "season" : "seasons")" // 簡易的に
        slider.minimumValue = 0 // Todo: 保持している別の値
        slider.maximumValue = Float(drama.seasonCount)
        slider.setThumbImageValue()

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
    }
}

