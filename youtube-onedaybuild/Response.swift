//
//  Response.swift
//  youtube-onedaybuild
//
//  Created by Shoes.s.Li on 2020/6/8.
//  Copyright © 2020 Shoes.s.Li. All rights reserved.
//

import Foundation

struct Response: Decodable {
    
    var items: [Video]?
    
    enum CodingKeys: String, CodingKey {
        
        case items
    }
    
    init (from decoder: Decoder) throws {
        
        // Get all 5 recent videos , 貌似在后面加.self 代表前面是个type
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
