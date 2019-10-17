//
//  FacebookEventRepository.swift
//  IOS@Taipei
//
//  Created by wk on 2019/10/17.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import Foundation
import FBSDKShareKit

final class FacebookEventRepository {
    static let shared = FacebookEventRepository()
    private init() {}

    private var accessToken: String?

    func setup(with accessToken: String) {
        self.accessToken = accessToken
    }

    func fetchFacebookEvents(then hanlder: @escaping(Result<[FacebookEvent], Error>) -> Void) {
        let groupId = "903202893043760"
        let basicFields = "description,end_time,name,place,start_time"
        let fields = basicFields + ",attending_count,declined_count,maybe_count,cover"
        let endpoint = "\(groupId)/events?fields=\(fields)"
        let httpMethod = HTTPMethod(rawValue: "GET")

        let request = GraphRequest(graphPath: endpoint, parameters: [:], tokenString: accessToken,
                                   version: nil, httpMethod: httpMethod)

        request.start { (connection, result, error) in

            print("connection -> \(connection)")
            print("result -> \(result)")
            print("error -> \(error)")

            guard let result = result else { return }
            guard let data = try? JSONSerialization.data(withJSONObject: result, options: .prettyPrinted) else {
                if let error = error {
                    hanlder(.failure(error))
                }
                return
            }

            do {
                let result = try JSONDecoder().decode(FacebookEventListResult.self, from: data)
                let events = result.data
                hanlder(.success(events))
            } catch {
                hanlder(.failure(error))
            }
        }

    }
}
