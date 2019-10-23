//
//  GroupEventRepository.swift
//  IOS@Taipei
//
//  Created by kuotinyen on 2019/10/23.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case unknown(Error?)
    case noResponseData
    case noDataModel
    case noFBAccessToken
}

 final class GroupEventRepository {
    static let shared = GroupEventRepository()
    private init() {}

     private var accessToken: String?

     func setup(with accessToken: String) {
        self.accessToken = accessToken
    }

     func fetchGroupEvents(then hanlder: @escaping(Result<[GroupEvent], Error>) -> Void) {
        let host = "https://graph.facebook.com/v4.0"
        let groupId = "903202893043760"
        let fields = "interested_count%2Cattending_count%2Cdeclined_count%2Cmaybe_count%2Cnoreply_count%2Ccover%2Cdescription%2Cname%2Cowner%2Cplace%2Cstart_time%2Cend_time%2Cupdated_time%2Ctype"
        
        RemoteConfigManager.shared.getValue(from: .fbToken) { value in
            guard let accessToken = value?.stringValue else { return hanlder(.failure(APIError.noFBAccessToken)) }
            let endpoint = "\(host)/\(groupId)/events?fields=\(fields)&access_token=\(accessToken)"
            
            guard let url = URL(string: endpoint) else {
                return hanlder(.failure(APIError.invalidURL))
            }

            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    return hanlder(.failure(error))
                }
                
                guard let data = data else {
                    return hanlder(.failure(APIError.noResponseData))
                }

                do {
                    let result = try JSONDecoder().decode(GroupEventResult.self, from: data)
                    hanlder(.success(result.data))
                } catch {
                    hanlder(.failure(error))
                }
            }
            
            task.resume()
        }
    }
}
