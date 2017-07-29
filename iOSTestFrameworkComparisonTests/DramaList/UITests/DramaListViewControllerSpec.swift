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

            beforeEach {
                viewController = DramaListViewController()
                presenterStub = DramaListPresenterStub(viewController: viewController)
                viewController.inject(presenter: presenterStub)
                presenterStub.resulutToBeReturned = DramaListModel.createDramaList(numberOfElements: 3)
                
                // UIViewController.viewにアクセスするとviewDidLoad()が実行される
                expect(viewController.view).notTo(beNil())
            }

            it("tableViewが表示されること") {
                let tableView = viewController.dramaListTableView
                expect(tableView).notTo(beNil())
            }

            it("tableViewCellが表示されること") {
                let tableView = viewController.dramaListTableView
                let indexPath = IndexPath(row: 0, section: 0)
                let cell = viewController.tableView(tableView, cellForRowAt: indexPath) as? DramaTableViewCell
                expect(cell).notTo(beNil())
            }

            it("titleLabelが表示されること") {
                let tableView = viewController.dramaListTableView
                let indexPath = IndexPath(row: 0, section: 0)
                let cell = viewController.tableView(tableView, cellForRowAt: indexPath) as? DramaTableViewCell
                let titleLabel = cell?.titleLabel
                expect(titleLabel?.text).to(equal("title 0"))
            }
        }
    }
}
