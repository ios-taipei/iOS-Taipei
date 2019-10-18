//
//  APIProtocols.swift
//  IOS@Taipei
//
//  Created by wk on 2019/10/18.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import Foundation

protocol RemoteFacebookEventRepositoryProtocol {
    func fetchFacebookEvents(then hanlder: @escaping(Result<[FacebookEvent], Error>) -> Void)
}
