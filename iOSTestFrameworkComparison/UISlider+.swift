//
//  CountSlider.swift
//  iOSTestFrameworkComparison
//
//  Created by Shunya Yamashita on 2017/07/28.
//  Copyright © 2017年 shymst. All rights reserved.
//

import UIKit

extension UISlider {

    var trackBounds: CGRect {
        return trackRect(forBounds: bounds)
    }

    var trackFrame: CGRect {
        guard let superView = superview else { return CGRect.zero }
        return self.convert(trackBounds, to: superView)
    }

    var thumbBounds: CGRect {
        return thumbRect(forBounds: frame, trackRect: trackBounds, value: value)
    }

    var thumbFrame: CGRect {
        return thumbRect(forBounds: bounds, trackRect: trackFrame, value: value)
    }

    func setThumbImageValue() {
        let buttonLabel = UILabel(frame: thumbFrame)
        buttonLabel.text = "\(Int(value))"
        buttonLabel.textColor = UIColor.darkGray
        buttonLabel.textAlignment = .center
        buttonLabel.backgroundColor = UIColor.white
        buttonLabel.layer.cornerRadius = buttonLabel.bounds.width / 2
        buttonLabel.layer.borderWidth = 1
        buttonLabel.layer.borderColor = UIColor.darkGray.cgColor
        buttonLabel.layer.masksToBounds = true
        setThumbImage(buttonLabel.toImage(), for: state)
    }
}

extension UIView {
    func toImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0)
        guard let currentContext = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        layer.render(in: currentContext)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
