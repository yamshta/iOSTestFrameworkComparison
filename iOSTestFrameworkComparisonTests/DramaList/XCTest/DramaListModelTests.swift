//
//  DramaModelTests.swift
//  iOSTestFrameworkComparison
//
//  Created by Shunya Yamashita on 2017/07/27.
//  Copyright © 2017年 shymst. All rights reserved.
//

import XCTest
@testable import iOSTestFrameworkComparison

class DramaModelTests: XCTestCase {

    var dramaEntity: DramaEntity!

    /**
     * テストの開始時に最初に一度呼ばれる関数
     * テストケースを回すために必要な設定やインスタンスの生成などをここで行う
     */
    override func setUp() {
        super.setUp()
        dramaEntity = DramaEntity(id: "1", title: "Doctor Who", image_url: "https://www.justwatch.com/images/poster/678041/s718/doctor-who", season_count: 10)
    }

    /**
     * テストの終了時に一度呼ばれる関数
     */
    override func tearDown() {
        // do something
    }

    /**
     * テスト対象の関数
     * 関数一つに対してテストケースを一つ書く
     * 関数名の頭文字が"test"で始まる関数かどうかで識別
     */
    // EntityをModelへ初期化できるか
    func test_init_success_EntityToModel() {
        // Given

        // When
        let dramaModel = DramaModel(data: dramaEntity)

        // Then
        XCTAssertEqual(dramaModel.id, "1")
        XCTAssertEqual(dramaModel.title, "Doctor Who")
        XCTAssertEqual(dramaModel.imageURL, URL(string: "https://www.justwatch.com/images/poster/678041/s718/doctor-who"))
        XCTAssertEqual(dramaModel.seasonCount, 10)
    }

    /**
     * パフォーマンスの計測用の関数
     * self.measure {} のクロージャの中に計測したい処理を記述するとその処理にかかった時間を教えてくれます。
     */
    func testPerformanceExample() {
        self.measure {
            // do something
        }
    }
}
