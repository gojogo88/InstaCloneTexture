//
//  Stories.swift
//  InstaCloneTexture
//
//  Created by Jonathan Go on 5/1/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import Foundation

struct Stories: Codable {
  var isWatched: Bool?
  var user: User?
  
  enum CodingKeys: String, CodingKey {
    case user
    case isWatched = "is_watched"
  }
}
