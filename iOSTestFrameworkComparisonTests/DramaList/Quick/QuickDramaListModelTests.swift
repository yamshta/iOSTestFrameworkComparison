//
//  QuickDramaListModelTests.swift
//  iOSTestFrameworkComparison
//
//  Created by Shunya Yamashita on 2017/07/28.
//  Copyright © 2017年 shymst. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import iOSTestFrameworkComparison

class QuickDramaListModelTests: QuickSpec {
    override func spec() {
        describe("Modelについて") {
            context("Entityから初期化した場合に") {
                var dramaEntity: DramaEntity!
                var dramaModel: DramaModel!

                beforeEach {
                    dramaEntity = DramaEntity(id: "1", title: "Doctor Who", image_url: "https://www.justwatch.com/images/poster/678041/s718/doctor-who", season_count: 10)
                    dramaModel = DramaModel(data: dramaEntity)
                }

                it("ModelとEntityの値が等しいこと") {
                    expect(dramaModel.id).to(equal(dramaEntity.id))
                    expect(dramaModel.title).to(equal(dramaEntity.title))
                    expect(dramaModel.imageURL).to(equal(URL(string: dramaEntity.image_url)))
                    expect(dramaModel.seasonCount).to(equal(dramaEntity.season_count))
                }
            }
        }
    }
}
