//
//  APIConfig.swift
//  TesteiOS
//
//  Created by Felipe Costa on 09/07/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import Foundation


protocol APIConfig {
    var serviceConfiguration: Configuration {get set}
}

struct Configuration {
    let baseEndpoint = Bundle.main.infoDictionary!["API_BASE_URL_ENDPOINT"] as! String
    let acceptableStatuses = [200]
    
    var service: String
    
    func fullEndpoint() -> String {
        return "\(baseEndpoint)\(service)"
    }
    
    func isStatusValid(status:Int) -> Bool {
        return acceptableStatuses.contains(status)
    }
}
