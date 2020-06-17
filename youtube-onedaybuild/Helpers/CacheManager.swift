//
//  CacheManager.swift
//  youtube-onedaybuild
//
//  Created by Shoes.s.Li on 2020/6/17.
//  Copyright © 2020 Shoes.s.Li. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String: Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        
        // store the image data and use the url as the key
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        
        // try to get the data for the specified rul
        return cache[url]
    }
}
