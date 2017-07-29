//
//  DramaListTranslatorSpec.swift
//  iOSTestFrameworkComparison
//
//  Created by Shunya Yamashita on 2017/07/28.
//  Copyright © 2017年 shymst. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import iOSTestFrameworkComparison

class DramaListTranslatorSpec: QuickSpec {
    override func spec() {
        describe("モデルの変換について") {
            context("EntityからModelへ変換した場合") {
                var translator: DramaListTranslator!
                var dramaEntities: [DramaEntity]!
                var dramaListModel: DramaListModel!

                beforeEach {
                    translator = DramaListTranslatorImpl()
                    dramaEntities = [
                        DramaEntity(id: "1", title: "Doctor Who", image_url: "https://www.justwatch.com/images/poster/678041/s718/doctor-who", season_count: 10),
                        DramaEntity(id: "2", title: "Breaking Bad", image_url: "https://www.justwatch.com/images/poster/458429/s718/breaking-bad", season_count: 5)
                    ]

                    dramaListModel = translator.translate(from: dramaEntities)
                }

                it("変換後のアイテム数が等しいこと") {
                    expect(dramaListModel.items).to(haveCount(dramaEntities.count))
                }

                it("変換後のアイテムとEntitiesの順番が等しいこと") {
                    for (index, model) in dramaListModel.items.enumerated() {
                        expect(model.id).to(equal(dramaEntities[index].id))
                    }
                }
            }
        }
    }
}
