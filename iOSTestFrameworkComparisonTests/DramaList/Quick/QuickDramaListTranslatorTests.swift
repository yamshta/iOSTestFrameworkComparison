//
//  QuickDramaListTranslatorTests.swift
//  iOSTestFrameworkComparison
//
//  Created by Shunya Yamashita on 2017/07/28.
//  Copyright © 2017年 shymst. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import iOSTestFrameworkComparison

class QuickDramaListTranslatorTests: QuickSpec {

    override func spec() {
        describe("Entityの集合体からModelの集合体へ変換する") {

            var translator: DramaListTranslator!
            var dramaEntities: [DramaEntity]!
            var dramaModels: DramaModels!

            beforeEach {
                translator = DramaListTranslatorImpl()
                dramaEntities = [
                    DramaEntity(id: "1", title: "Doctor Who", image_url: "https://www.justwatch.com/images/poster/678041/s718/doctor-who", season_count: 10),
                    DramaEntity(id: "2", title: "Breaking Bad", image_url: "https://www.justwatch.com/images/poster/458429/s718/breaking-bad", season_count: 5)
                ]

                dramaModels = translator.translate(from: dramaEntities)
            }

            it("変換後のアイテム数が等しいこと") {
                expect(dramaModels.items).to(haveCount(dramaEntities.count))
            }

            it("変換後の最初のアイテムとEntitiesの最初のアイテムが等しいこと") {
                expect(dramaModels.items.first?.id).to(equal(dramaEntities.first?.id))
                expect(dramaModels.items.first?.title).to(equal(dramaEntities.first?.title))
                expect(dramaModels.items.first?.imageURL).to(equal(URL(string: (dramaEntities.first?.image_url)!)))
                expect(dramaModels.items.first?.seasonCount).to(equal(dramaEntities.first?.season_count))
            }
        }
    }
}
