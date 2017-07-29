//
//  DramaTableViewCell.swift
//  iOSTestFrameworkComparison
//
//  Created by Shunya Yamashita on 2017/07/27.
//  Copyright © 2017年 shymst. All rights reserved.
//

import UIKit

class DramaTableViewCell: UITableViewCell {

    let thumbImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.accessibilityIdentifier = "thumbImageView"
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.darkGray
        label.accessibilityIdentifier = "titleLabel"
        return label
    }()

    let seasonCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.gray
        label.accessibilityIdentifier = "seasonCountLabel"
        return label
    }()

    let seasonSlider: UISlider = {
        let slider = UISlider()
        slider.accessibilityIdentifier = "seasonSlider"
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
        addSubview(thumbImageView)
        thumbImageView.translatesAutoresizingMaskIntoConstraints = false
        thumbImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        thumbImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        thumbImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/6).isActive = true
        thumbImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        thumbImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true

        thumbImageView.layer.shadowOffset = CGSize.zero
        thumbImageView.layer.shadowColor = UIColor.black.cgColor
        thumbImageView.layer.shadowOpacity = 0.2
        thumbImageView.layer.shadowPath = UIBezierPath(rect: thumbImageView.bounds).cgPath
        thumbImageView.layer.masksToBounds = false

        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: thumbImageView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: thumbImageView.trailingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

        addSubview(seasonCountLabel)
        seasonCountLabel.translatesAutoresizingMaskIntoConstraints = false
        seasonCountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2).isActive = true
        seasonCountLabel.leadingAnchor.constraint(equalTo: thumbImageView.trailingAnchor, constant: 10).isActive = true
        seasonCountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

        addSubview(seasonSlider)
        seasonSlider.translatesAutoresizingMaskIntoConstraints = false
        seasonSlider.leadingAnchor.constraint(equalTo: thumbImageView.trailingAnchor, constant: 10).isActive = true
        seasonSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        seasonSlider.bottomAnchor.constraint(equalTo: thumbImageView.bottomAnchor).isActive = true
    }

    func setData(_ drama: DramaModel) {
        titleLabel.text = drama.title
        // 簡易的に単数形を判断
        seasonCountLabel.text = "\(drama.seasonCount) \(drama.seasonCount == 1 ? "season" : "seasons")"
        // TODO: DBで保持している値を設定
        seasonSlider.minimumValue = 0
        seasonSlider.maximumValue = Float(drama.seasonCount)
        seasonSlider.setThumbImageValue()

        thumbImageView.image = nil
        DispatchQueue.global(qos: .default).async {
            _ = URLSession.shared.dataTask(with: drama.imageURL) { [weak self] data, _, error in
                if let error = error {
                    print(error)
                } else if let data = data {
                    DispatchQueue.main.async {
                        self?.thumbImageView.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
    }
}

