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
    
    override func setUp() {
        super.setUp()
        dramaEntity = DramaEntity(id: "1", title: "Doctor Who", image_url: "https://www.justwatch.com/images/poster/678041/s718/doctor-who", season_count: 10)
    }
    
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
}
