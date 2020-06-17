//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by Shoes.s.Li on 2020/6/17.
//  Copyright © 2020 Shoes.s.Li. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v: Video) {
        
        video = v
        
        // Ensure that we have a video
        guard video != nil else { return }
        
        // Set the title of the video
        titleLabel.text = video?.title
        
        // Set the date string of the video
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = dateFormat.string(from: video!.published)
        
        // Set the thumbnail Image
        // 0. Ensure there is a thumbnail url string
        guard video!.thumbnail != "" else { return }
        
        // Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            // Set the thumbnail imageview
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        // Download the thumbnail data if not exist in cache manager
        // 1. Create a URL object
        let url = URL(string: video!.thumbnail)
        guard url != nil else { return }
        
        // 2. Get a URLSession object
        let session = URLSession.shared
        
        // 3. Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                // Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                // Check that the downloaded url matches the video thumbnail url that this cell is currently set to display
                if url!.absoluteString != self.video?.thumbnail {
                    // Video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                
                // Create the thumbnail image
                let thumbnailImage = UIImage(data: data!)
                
                // Through the main thread
                DispatchQueue.main.async {
                    // pass the image to thumbnail image view
                    self.thumbnailImageView.image = thumbnailImage
                }
            }
        }
        
        // 4. Kick off the data task
        dataTask.resume()
    }
}
