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
    static func createDramaModels() -> DramaModels {
        let dramaEntities: [DramaEntity] = [
            DramaEntity(id: "", title: "Breaking Bad", image_url: "https://www.justwatch.com/images/poster/458429/s718/breaking-bad", season_count: 5),
            DramaEntity(id: "", title: "The Walking Dead", image_url: "https://www.justwatch.com/images/poster/458725/s718/the-walking-dead", season_count: 7),
            DramaEntity(id: "", title: "Doctor Who", image_url: "https://www.justwatch.com/images/poster/678041/s718/doctor-who", season_count: 10)
        ]

        var dramaModels = DramaModels()
        dramaEntities.forEach {
            dramaModels.items.append(DramaModel(data: $0))
        }

        return dramaModels
    }
}
