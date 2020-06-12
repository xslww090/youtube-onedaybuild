//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Shoes.s.Li on 2020/6/8.
//  Copyright © 2020 Shoes.s.Li. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    // 为在 viewcontroller 中返回得到的视频做准备
    func videoFetched(_ videos: [Video])
}

class Model {
    
    // 先设一个变量等着在 viewcontroller 中被召唤等于 itself
    var delegate: ModelDelegate?
    
    func getVideos() {
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else { return }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            do {
                
                // Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    
                    // through the main thread
                    DispatchQueue.main.async {
                        // Call the "videosFetched" method of the delegata
                        self.delegate?.videoFetched(response.items!)
                    }
                }
                
                // dump(response)
            }
            catch {
                
            }
            
        }
        
        // Kick off the task
        dataTask.resume()
        
    }
}
