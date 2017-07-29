
//
//  DramaListModel.swift
//  iOSTestFrameworkComparison
//
//  Created by Shunya Yamashita on 2017/07/27.
//  Copyright © 2017年 shymst. All rights reserved.
//

import XCTest
@testable import iOSTestFrameworkComparison

extension DramaListModel {
    // 与えられた数値分モデルを渡す
    static func createDramaList(numberOfElements number: Int) -> DramaListModel {
        var dramaListModel = DramaListModel()
        for i in 0..<number {
            let drama = DramaModel.createDrama(index: i)
            dramaListModel.items.append(drama)
        }
        return dramaListModel
    }
}

extension DramaModel {
    static func createDrama(index: Int = 0) -> DramaModel {
        return DramaModel(id: "\(index)", title: "title \(index)", imageURL: URL(string: "imageURL_\(index)")!, seasonCount: index)
    }
}
