//
//  APIConfig.swift
//  TesteiOS
//
//  Created by Felipe Costa on 09/07/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import Foundation



class APIConfig: APIConfigurationProtocol {
    let acceptableStatuses = [200]
    var baseEndpoint:String
    var serviceName: String
    
    init?(serviceName: String) {
        guard let info = Bundle.main.infoDictionary,
            let baseEndpoint = info["API_BASE_URL_ENDPOINT"] as? String
        else {
            debugPrint("Info.plist doesn't contain key API_BASE_URL_ENDPOINT!")
            return nil
        }
        self.baseEndpoint = baseEndpoint
        self.serviceName = serviceName
    }
    
    func serviceEndpoint() -> String {
        return "\(baseEndpoint)\(serviceName)"
    }
    func isStatusValid(status:Int) -> Bool {
        return acceptableStatuses.contains(status)
    }
}


protocol APIConfigurationProtocol {
    var baseEndpoint:String {get}
    func serviceEndpoint() -> String
    func isStatusValid(status:Int) -> Bool
}

protocol DataAPI {
    var config: APIConfigurationProtocol {get set}
}


