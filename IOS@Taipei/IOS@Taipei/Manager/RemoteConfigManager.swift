//
//  RemoteConfigManager.swift
//  IOS@Taipei
//
//  Created by kidnapper on 2019/10/18.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import FirebaseRemoteConfig

enum RemoteConfigKeys: String {
    static let prefix: String = "iosAtTaipei"
    
    case fbToken = "iosAtTaipei_FBToken"
}

final class RemoteConfigManager {
    
    static let shared: RemoteConfigManager = RemoteConfigManager()
    
    let remoteConfig: RemoteConfig = RemoteConfig.remoteConfig()
    
    private(set) var values: [RemoteConfigKeys: RemoteConfigValue] = [:]
    
    private init() {
        setDefaultValue()
        let settings: RemoteConfigSettings = RemoteConfigSettings()
        
        #if DEBUG
        // default value of minimumFetchInterval is 43200.0
        settings.minimumFetchInterval = 0
        #endif
        
        remoteConfig.configSettings = settings
        fetch(with: remoteConfig.configSettings.minimumFetchInterval,
              completion: nil)
    }
    
    private func fetch(with minimumInterval: TimeInterval, completion: (() -> Void)?) {
        remoteConfig.fetch(withExpirationDuration: remoteConfig.configSettings.minimumFetchInterval) { [weak self] status, error in
            guard let self = self else { return }
            if status == .success {
                self.remoteConfig.activate(completionHandler: nil)
                self.setValuesFromRemote()
                completion?()
            } else {
                completion?()
            }
        }
    }
    
    func getValue(from key: RemoteConfigKeys, completion: @escaping ((RemoteConfigValue?) -> Void)) {
        guard values.isEmpty else {
            completion(remoteConfig.configValue(forKey: key.rawValue))
            return
        }
        fetch(with: remoteConfig.configSettings.minimumFetchInterval) { [weak self] in
            guard let self = self else { return completion(nil) }
            completion(self.values[key] ?? self.remoteConfig.configValue(forKey: key.rawValue,
                                                                         source: .default))
        }
    }
    
    private func setDefaultValue() {
        remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
    }
    
    // to know list with prefix of centain words in keys
    // RemoteConfig.remoteConfig().keys(withPrefix: "iosAtTaipei")
    private func setValuesFromRemote() {
        let configKeys: Set<String> = remoteConfig.keys(withPrefix: RemoteConfigKeys.prefix)
        
        for configKey in configKeys {
            let value: RemoteConfigValue = remoteConfig.configValue(forKey: configKey)
            if let key: RemoteConfigKeys = RemoteConfigKeys(rawValue: configKey) {
                values[key] = value
            }
        }
    }
    
}
