//
//  DramaListPresenterStub.swift
//  iOSTestFrameworkComparison
//
//  Created by Shunya Yamashita on 2017/07/27.
//  Copyright © 2017年 shymst. All rights reserved.
//

import XCTest
@testable import iOSTestFrameworkComparison

class DramaListPresenterStub: DramaListPresenter {
    private weak var viewController: DramaListViewControllerOutput?
    
    var dramaList = DramaListModel()

    // Testsで生成する際にこの値を設定する
    var resulutToBeReturned: DramaListModel!

    init(viewController: DramaListViewControllerOutput) {
        self.viewController = viewController
    }

    func fetchDramaList() {
        // (?) Timerなどで再現するか必要があるか
        // （実装の仕方が悪い気もする）
        viewController?.setDramaListState(.loading)

        // 設定された値をそのまま返す
        self.dramaList.items += resulutToBeReturned.items
        let state = self.dramaList.items.count == 0 ? DramaListState.blank : DramaListState.working
        self.viewController?.setDramaListState(state)
    }
}
