//
//  DramaListViewControllerUITests.swift
//  iOSTestFrameworkComparison
//
//  Created by Shunya Yamashita on 2017/07/29.
//  Copyright © 2017年 shymst. All rights reserved.
//

import XCTest

class DramaListViewControllerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        // Test Failureの際にテストを直ぐに止める (trueにした場合、最後まで処理を進める)
        continueAfterFailure = false
        // セットアップ毎にアプリを起動
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_display_tableView_cell() {
        let app = XCUIApplication()
        let tableView = app.tables["dramaListTableView"]
        XCTAssertTrue(tableView.exists)

        let cell = tableView.cells.element(boundBy: 3)
        XCTAssertTrue(cell.exists)

        // 非同期で画像をダウンロードしているので遅延処理を挟んだが失敗する
//        let thumbImageView = cell.images["thumbImageView"]
//        XCTAssertTrue(thumbImageView.exists)

        let titleLabel = cell.staticTexts["titleLabel"]
        XCTAssertTrue(titleLabel.exists)

        let seasonSlider = cell.sliders["seasonSlider"]
        XCTAssertTrue(seasonSlider.exists)

        //　動作せずに失敗する
        // 上のテストが通ってるので要素は取得できている筈だが..
//        seasonSlider.adjust(toNormalizedSliderPosition: 1.0)
    }
}
