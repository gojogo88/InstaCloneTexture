//
//  BaseDataSource.swift
//  InstaCloneTexture
//
//  Created by Jonathan Go on 5/1/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import Foundation

struct BaseDataSource: Codable {
  var stories: [Stories]?
  var newsFeed: [NewsFeed]?
  
  enum CodingKeys: String, CodingKey {
    case stories
    case newsFeed = "news_feed"
  }
}
