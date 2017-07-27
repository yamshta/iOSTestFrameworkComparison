//
//  DramaListPresenterTests.swift
//  iOSTestFrameworkComparison
//
//  Created by Shunya Yamashita on 2017/07/27.
//  Copyright © 2017年 shymst. All rights reserved.
//

import XCTest
@testable import iOSTestFrameworkComparison

class DramaListPresenterTests: XCTestCase {

    let viewController = DramaListViewController()
    let wireframe = DramaListWireframeImpl(viewController: DramaListViewController())
    let useCaseStub = DramaListUseCaseStub()

    var presenter: DramaListPresenterImpl!
    
    override func setUp() {
        super.setUp()

        presenter = DramaListPresenterImpl(viewController: viewController, wireframe: wireframe, useCase: useCaseStub)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_fetchDramas_success_fetchDramas() {
        // Given
        let expectedNumberOfDramaModels = 3
        let doramasToBeReturned = DramaModel.createDramaModels()
        useCaseStub.resulutToBeReturned = doramasToBeReturned

        // When
        presenter.fetchDramas()

        // Then
        XCTAssertEqual(expectedNumberOfDramaModels, presenter.dramas.items.count, "Number of dorams missmatch")
    }
}
