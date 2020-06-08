//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Shoes.s.Li on 2020/6/8.
//  Copyright © 2020 Shoes.s.Li. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos() {
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else { return }
        
        // Get a URLSession object
//          错误:  let session = URLSession(configuration: .default).dataTask(with: url!)
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
//          错误:  let dataTask = URLSessionDataTask()
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            // TODO: Parsing the data into video objects
        }
        
        // Kick off the task
        dataTask.resume()
        
    }
}
