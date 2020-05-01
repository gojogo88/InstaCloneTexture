//
//  User.swift
//  InstaCloneTexture
//
//  Created by Jonathan Go on 5/1/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import Foundation

struct User: Codable {
  let userId: Int?
  let profileImageUrl: String?
  let username: String?
  
  enum CodingKeys: String, CodingKey {
    case username
    case userId = "user_id"
    case profileImageUrl = "profile_image_url"
  }
}
