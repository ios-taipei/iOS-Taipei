//
//  RemoteConfigTests.swift
//  IOS@TaipeiTests
//
//  Created by kidnapper on 2019/10/18.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import XCTest

class RemoteConfigTests: XCTestCase {
    
    let manager: RemoteConfigManager = RemoteConfigManager.shared

    override func setUp() {
        
    }

    override func tearDown() {
        
    }
    
    func testFBTokenDefault() {
        let defaultFBToken: String? = manager.remoteConfig.configValue(forKey: RemoteConfigKeys.fbToken.rawValue, source: .default).stringValue
        XCTAssert(defaultFBToken == "this is not an valid token", "❌ value from RemoteConfigDefaults.plist should match \"this is not an valid token\"")
    }

    func testFBTokenFetch() {
        RemoteConfigManager.shared.getValue(from: .fbToken) { value in
            XCTAssert(value?.stringValue == "this is fb token", "❌ value from firebase should match \"this is fb token\"")
        }
    }

}
