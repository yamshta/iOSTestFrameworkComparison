//
//  DramaListTranslatorTests.swift
//  iOSTestFrameworkComparison
//
//  Created by Shunya Yamashita on 2017/07/27.
//  Copyright © 2017年 shymst. All rights reserved.
//

import XCTest
@testable import iOSTestFrameworkComparison

class DramaListTranslatorTests: XCTestCase {

    var dramaEntities: [DramaEntity]!
    var translator: DramaListTranslator!
    
    override func setUp() {
        super.setUp()
        dramaEntities = [
            DramaEntity(id: "1", title: "Doctor Who", image_url: "https://www.justwatch.com/images/poster/678041/s718/doctor-who", season_count: 10),
            DramaEntity(id: "2", title: "Breaking Bad", image_url: "https://www.justwatch.com/images/poster/458429/s718/breaking-bad", season_count: 5)
        ]

        translator = DramaListTranslatorImpl()
    }

    // 変換後のアイテム数が等しいこと
    func test_translate_success_numberOfDramaList() {
        // Given

        // When
        let dramaListModel = translator.translate(from: dramaEntities)

        // Then
        XCTAssertEqual(dramaListModel.items.count, 2)
    }

    // 変換後のアイテムとEntitiesの順番が等しいこと
    func test_translate_success_equalFirstDrama() {
        // Given

        // When
        let dramaListModel = translator.translate(from: dramaEntities)

        // Then
        for (index, model) in dramaListModel.items.enumerated() {
            XCTAssertEqual(model.id, dramaEntities[index].id)
        }
    }
}
