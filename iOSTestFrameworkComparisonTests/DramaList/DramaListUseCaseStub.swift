//
//  DramaListUseCaseStub.swift
//  iOSTestFrameworkComparison
//
//  Created by Shunya Yamashita on 2017/07/27.
//  Copyright © 2017年 shymst. All rights reserved.
//

import XCTest
@testable import iOSTestFrameworkComparison

class DramaListUseCaseStub: DramaListUseCase {

    // Testsで生成する際にこの値を設定する
    var resulutToBeReturned: DramaModels!

    func fetchDramas(_ closure: @escaping (DramaModels) -> Void) {
        // 設定された値をそのまま返す
        closure(resulutToBeReturned)
    }
}
