//
//  DramaListViewControllerSpy.swift
//  iOSTestFrameworkComparison
//
//  Created by Shunya Yamashita on 2017/07/27.
//  Copyright © 2017年 shymst. All rights reserved.
//

import XCTest
@testable import iOSTestFrameworkComparison

class DramaListViewControllerSpy: DramaListViewControllerOutput {

    // Testsから確認できるように値を保持する
    private(set) var dramaListState: DramaListState!

    func setDramaListState(_ state: DramaListState) {
        self.dramaListState = state
    }
}
