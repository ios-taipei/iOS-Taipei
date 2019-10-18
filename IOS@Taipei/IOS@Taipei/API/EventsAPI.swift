//
//  EventsAPI.swift
//  IOS@Taipei
//
//  Created by wk on 2019/10/18.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case noResponseData
}

final class EventsAPI: RemoteFacebookEventRepositoryProtocol {
    static let shared = EventsAPI()
    private init() {}

    func fetchFacebookEvents(then hanlder: @escaping (Result<[FacebookEvent], Error>) -> Void) {
        let groupID = "903202893043760"
        let basicFields = "description,end_time,name,place,start_time"
        let fields = basicFields + ",attending_count,declined_count,maybe_count,cover"
        let urlString = "https://graph.facebook.com/v4.0/\(groupID)/events?fields=\(fields)&access_token=\(Secrets.accessToken.rawValue)"

        guard let url = URL(string: urlString) else {
            hanlder(.failure(APIError.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else {
                    hanlder(.failure(APIError.noResponseData))
                    return
                }

                let result = try JSONDecoder().decode(FacebookEventListResult.self, from: data)
                let events = result.data
                hanlder(.success(events))
            } catch {
                hanlder(.failure(error))
            }
        }

        task.resume()
    }
}
