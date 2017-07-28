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

    let viewControllerSpy = DramaListViewControllerSpy()
    let wireframe = DramaListWireframeImpl(viewController: DramaListViewController())
    let useCaseStub = DramaListUseCaseStub()

    var presenter: DramaListPresenterImpl!
    
    override func setUp() {
        super.setUp()

        presenter = DramaListPresenterImpl(viewController: viewControllerSpy, wireframe: wireframe, useCase: useCaseStub)
    }

    // 想定通りにドラマ数分の取得ができているか
    func test_fetchDramas_success_numberOfDramas() {
        // Given
        let expectedNumberOfDramas = 3
        let doramasToBeReturned = DramaModel.createDramas(numberOfElements: expectedNumberOfDramas)
        useCaseStub.resulutToBeReturned = doramasToBeReturned

        // When
        presenter.fetchDramas()

        // Then
        XCTAssertEqual(expectedNumberOfDramas, presenter.dramas.items.count)
    }

    // 想定通りにDramaListStateがセットされているか（データが存在しない）
    func test_fetchDramas_success_setDramaListState_blank() {
        // Given
        let expectedDramaListState = DramaListState.blank
        let doramasToBeReturned = DramaModel.createDramas(numberOfElements: 0)
        useCaseStub.resulutToBeReturned = doramasToBeReturned

        // When
        presenter.fetchDramas()

        // Then
        XCTAssertEqual(expectedDramaListState, viewControllerSpy.dramaListState)
    }

    // 想定通りにDramaListStateがセットされているか（データが存在する）
    func test_fetchDramas_success_setDramaListState_working() {
        // Given
        let expectedDramaListState = DramaListState.working
        let doramasToBeReturned = DramaModel.createDramas(numberOfElements: 3)
        useCaseStub.resulutToBeReturned = doramasToBeReturned

        // When
        presenter.fetchDramas()

        // Then
        XCTAssertEqual(expectedDramaListState, viewControllerSpy.dramaListState)
    }

//    // 想定通りにDramaListStateがセットされているか（エラー）
//    func test_fetchDramas_success_setDramaListState_working() {
//    }
}
