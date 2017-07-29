//
//  DramaListPresenterSpec.swift
//  iOSTestFrameworkComparison
//
//  Created by Shunya Yamashita on 2017/07/28.
//  Copyright © 2017年 shymst. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import iOSTestFrameworkComparison

class DramaListPresenterSpec: QuickSpec {
    // ここにテストコードを書いていく
    override func spec() {
        // DI(Dependency injection)
        let viewControllerSpy = DramaListViewControllerSpy()
        let wireframe = DramaListWireframeImpl(viewController: DramaListViewController())
        let useCaseStub = DramaListUseCaseStub()

        // 対象のレイヤ
        var presenter: DramaListPresenterImpl!

        // テストで使う変数
        var dramaListToBeReturned: DramaListModel!

        describe("ドラマの取得について") {
            beforeEach {
                presenter = DramaListPresenterImpl(viewController: viewControllerSpy, wireframe: wireframe, useCase: useCaseStub)
            }

            context("ドラマ数が3の場合") {
                let expectedNumberOfDramaList = 3

                beforeEach {
                    dramaListToBeReturned = DramaModel.createDramaList(numberOfElements: expectedNumberOfDramaList)
                    useCaseStub.resulutToBeReturned = dramaListToBeReturned
                    presenter.fetchDramaList()
                }
                it("ドラマ数とexpectedNumberOfDramaListが等しいこと") {
                    expect(presenter.dramaList.items.count).to(equal(expectedNumberOfDramaList))
                }
            }
        }

        describe("DramaListStateについて") {
            beforeEach {
                presenter = DramaListPresenterImpl(viewController: viewControllerSpy, wireframe: wireframe, useCase: useCaseStub)
            }

            context("ドラマが存在しない場合") {
                beforeEach {
                    dramaListToBeReturned = DramaModel.createDramaList(numberOfElements: 0)
                    useCaseStub.resulutToBeReturned = dramaListToBeReturned
                    presenter.fetchDramaList()
                    print(presenter.dramaList.items)
                }
                it("viewControllerSpy.dramaListStateが.blankであること") {
                    expect(viewControllerSpy.dramaListState).to(equal(DramaListState.blank))
                }
            }

            context("ドラマ数が3の場合") {
                beforeEach {
                    dramaListToBeReturned = DramaModel.createDramaList(numberOfElements: 3)
                    useCaseStub.resulutToBeReturned = dramaListToBeReturned
                    presenter.fetchDramaList()
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
