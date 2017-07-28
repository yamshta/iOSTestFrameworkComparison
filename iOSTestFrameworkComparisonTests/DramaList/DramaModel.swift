//
//  DramaModel.swift
//  iOSTestFrameworkComparison
//
//  Created by Shunya Yamashita on 2017/07/27.
//  Copyright © 2017年 shymst. All rights reserved.
//

import XCTest
@testable import iOSTestFrameworkComparison

extension DramaModel {
    // 与えられた数値分モデルを渡す
    static func createDramas(numberOfElements number: Int) -> DramaModels {
        var dramaModels = DramaModels()
        for i in 0..<number {
            let drama = createDrama(index: i)
            dramaModels.items.append(drama)
        }
        return dramaModels
    }

    static func createDrama(index: Int = 0) -> DramaModel {
        return DramaModel(id: "\(index)", title: "\(index)", imageURL: URL(string: "\(index)")!, seasonCount: index)
    }
}
