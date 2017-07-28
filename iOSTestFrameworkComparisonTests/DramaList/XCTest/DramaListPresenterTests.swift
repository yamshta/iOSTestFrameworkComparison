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

    // ドラマ数が３つになっていること
    func test_fetchDramaList_success_numberOfDramaList() {
        // Given
        let expectedNumberOfDramaList = 3
        let dramaListToBeReturned = DramaModel.createDramaList(numberOfElements: expectedNumberOfDramaList)
        useCaseStub.resulutToBeReturned = dramaListToBeReturned

        // When
        presenter.fetchDramaList()

        // Then
        XCTAssertEqual(expectedNumberOfDramaList, presenter.dramaList.items.count)
    }

    // ドラマが存在しない場合、DramaListStateに.blankがセットされていること
    func test_fetchDramaList_success_setDramaListState_blank() {
        // Given
        let expectedDramaListState = DramaListState.blank
        let dramaListToBeReturned = DramaModel.createDramaList(numberOfElements: 0)
        useCaseStub.resulutToBeReturned = dramaListToBeReturned

        // When
        presenter.fetchDramaList()

        // Then
        XCTAssertEqual(expectedDramaListState, viewControllerSpy.dramaListState)
    }

    // ドラマが存在する場合、DramaListStateに.workingがセットされていること
    func test_fetchDramaList_success_setDramaListState_working() {
        // Given
        let expectedDramaListState = DramaListState.working
        let dramaListToBeReturned = DramaModel.createDramaList(numberOfElements: 3)
        useCaseStub.resulutToBeReturned = dramaListToBeReturned

        // When
        presenter.fetchDramaList()

        // Then
        XCTAssertEqual(expectedDramaListState, viewControllerSpy.dramaListState)
    }

//    // エラーの場合、DramaListStateに.errorがセットされていること
//    func test_fetchDramaList_success_setDramaListState_working() {
//    }
}
