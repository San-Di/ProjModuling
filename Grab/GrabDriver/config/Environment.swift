//
//  Environment.swift
//  GrabDriver
//
//  Created by Sandi on 11/30/19.
//  Copyright © 2019 Sandi. All rights reserved.
//

import Foundation

// info.plist => bundle.main.infoDictionary
public enum Environment {
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Info.plist not found")
        }
        
        return dict
    }()
    
    
    static let rootUrl: URL = {
        guard let rootUrlString = Environment.infoDictionary["ROOT_URL"] as? String else {
            fatalError("ROOT_URL key not found in info.plist")
        }
        
        guard let url = URL(string: rootUrlString) else {
            fatalError("Root url is invalid")
        }
        return url
    }()
}
