//
//  DramaListViewControllerSpec.swift
//  iOSTestFrameworkComparison
//
//  Created by Shunya Yamashita on 2017/07/29.
//  Copyright © 2017年 shymst. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import iOSTestFrameworkComparison

/**
 *  UIテストだがQuickで実装するのでTestsフォルダ下に置く
 */

class DramaListViewControllerSpec: QuickSpec {
    override func spec() {
        describe("DramaListViewControllerについて") {
            var viewController: DramaListViewController!
            var presenterStub: DramaListPresenterStub!

            var tableView: UITableView!

            beforeEach {
                viewController = DramaListViewController()
                presenterStub = DramaListPresenterStub(viewController: viewController)
                viewController.inject(presenter: presenterStub)
            }

            context("ドラマ数が3の場合") {
                beforeEach {
                    presenterStub.resulutToBeReturned = DramaListModel.createDramaList(numberOfElements: 3)

                    // UIViewController.viewにアクセスするとviewDidLoad()が実行される
                    expect(viewController.view).notTo(beNil())
                    tableView = viewController.dramaListTableView
                }

                it("tableViewが表示されること") {
                    expect(tableView.isHidden).to(beFalse())
                }

                it("blankLabelが表示されないこと") {
                    let label = viewController.blankLabel
                    expect(label.isHidden).to(beTrue())
                }

                it("tableViewCellが表示されること") {
                    let indexPath = IndexPath(row: 0, section: 0)
                    let cell = viewController.tableView(tableView, cellForRowAt: indexPath) as? DramaTableViewCell
                    expect(cell).notTo(beNil())
                }

                xit("thumbImageViewが表示されること") {
                    //　DramaListModel.createDramaList(numberOfElements: 3) でまともなURLを渡してないのでテストできない
                }

                context("indexPath.rowの「2」を選択した場合") {
                    it("titleLabelが「title 2」表示されること") {
                        let indexPath = IndexPath(row: 2, section: 0)
                        let cell = viewController.tableView(tableView, cellForRowAt: indexPath) as? DramaTableViewCell
                        let titleLabel = cell?.titleLabel
                        expect(titleLabel?.text).to(equal("title 2"))
                    }

                    it("seasonLabelが「2 seasons」表示されること") {
                        let indexPath = IndexPath(row: 2, section: 0)
                        let cell = viewController.tableView(tableView, cellForRowAt: indexPath) as? DramaTableViewCell
                        let label = cell?.seasonLabel
                        expect(label?.text).to(equal("2 seasons"))
                    }

                    it("seasonSliderのmaximumValueが「2」と表示されること") {
                        let indexPath = IndexPath(row: 2, section: 0)
                        let cell = viewController.tableView(tableView, cellForRowAt: indexPath) as? DramaTableViewCell
                        let slider = cell?.seasonSlider
                        expect(slider?.maximumValue).to(equal(2))
                    }
                }
            }

            context("ドラマ数が0の場合") {
                beforeEach {
                    presenterStub.resulutToBeReturned = DramaListModel.createDramaList(numberOfElements: 0)

                    expect(viewController.view).notTo(beNil())
                    tableView = viewController.dramaListTableView
                }

                it("tableViewが表示されないこと") {
                    expect(tableView.isHidden).to(beTrue())
                }

                it("blankLabelが表示されること") {
                    let label = viewController.blankLabel
                    expect(label.isHidden).to(beFalse())
                }

                it("「データがありません😩」と表示されること") {
                    let label = viewController.blankLabel
                    expect(label.text).to(equal("データがありません😩"))
                }
            }
        }
    }
}
