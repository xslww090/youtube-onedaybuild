//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by Shoes.s.Li on 2020/6/8.
//  Copyright © 2020 Shoes.s.Li. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyCttqfKhk-g_QVuIfB1T_2T3v5WIJUn_Q8"
    static var PLAYLIST_ID = "UU2D6eRvCeMtcF5OGHf1-trw"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
