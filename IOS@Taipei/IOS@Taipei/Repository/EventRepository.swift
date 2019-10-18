//
//  EventRepository.swift
//  IOS@Taipei
//
//  Created by wk on 2019/10/17.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import Foundation

final class EventRepository: RemoteFacebookEventRepositoryProtocol {
    static let shared = EventRepository()
    private init() {}

    func fetchFacebookEvents(then hanlder: @escaping(Result<[FacebookEvent], Error>) -> Void) {
        EventsAPI.shared.fetchFacebookEvents(then: hanlder)
    }
}
