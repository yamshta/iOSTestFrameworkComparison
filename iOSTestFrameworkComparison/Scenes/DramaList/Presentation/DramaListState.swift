//
//  DramaListState.swift
//  iOSTestFrameworkComparison
//
//  Created by Shunya Yamashita on 2017/07/27.
//  Copyright © 2017年 shymst. All rights reserved.
//

import Foundation

enum DramaListState {
    case blank
    case loading
    case working
    case error

    func fetchEnabled() -> Bool {
        switch self {
        case .blank, .working:
            return true
        default:
            return false
        }
    }
}
