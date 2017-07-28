//
//  QuickDramaListPresenterTests.swift
//  iOSTestFrameworkComparison
//
//  Created by Shunya Yamashita on 2017/07/28.
//  Copyright © 2017年 shymst. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import iOSTestFrameworkComparison

class QuickDramaListPresenterTests: QuickSpec {

    // ここにテストコードを書いていく
    override func spec() {
        describe("ドラマ（複数）を取得する") {
            // DI(Dependency injection)
            let viewControllerSpy = DramaListViewControllerSpy()
            let wireframe = DramaListWireframeImpl(viewController: DramaListViewController())
            let useCaseStub = DramaListUseCaseStub()

            // 対象のレイヤ
            var presenter: DramaListPresenterImpl!

            // テストで使う変数
            var expectedNumberOfDramas: Int!
            var doramasToBeReturned: DramaModels!

            beforeEach {
                presenter = DramaListPresenterImpl(viewController: viewControllerSpy, wireframe: wireframe, useCase: useCaseStub)
            }

            context("ドラマ数が3の場合") {
                beforeEach {
                    expectedNumberOfDramas = 3
                    doramasToBeReturned = DramaModel.createDramas(numberOfElements: expectedNumberOfDramas)
                    useCaseStub.resulutToBeReturned = doramasToBeReturned
                    presenter.fetchDramas()
                }
                it("expectedNumberOfDramasとdramas.items.countが等しいこと") {
                    expect(presenter.dramas.items.count).to(equal(expectedNumberOfDramas))
                }
            }


            describe("DramaListStateをセットする") {
                context("ドラマ数が3の場合") {
                    beforeEach {
                        doramasToBeReturned = DramaModel.createDramas(numberOfElements: 0)
                        useCaseStub.resulutToBeReturned = doramasToBeReturned
                        presenter.fetchDramas()
                    }
                    it("viewControllerSpy.dramaListStateが.blankであること") {
                        expect(viewControllerSpy.dramaListState).to(equal(DramaListState.blank))
                    }
                }

                context("ドラマが存在しない場合") {
                    beforeEach {
                        doramasToBeReturned = DramaModel.createDramas(numberOfElements: 3)
                        useCaseStub.resulutToBeReturned = doramasToBeReturned
                        presenter.fetchDramas()
                    }
                    it("viewControllerSpy.dramaListStateが.workingであること") {
                        expect(viewControllerSpy.dramaListState).to(equal(DramaListState.working))
                    }
                }

                context("エラーの場合") {
                    it("viewControllerSpy.dramaListStateが.errorであること") {
                    }
                }
            }
        }
    }
}
