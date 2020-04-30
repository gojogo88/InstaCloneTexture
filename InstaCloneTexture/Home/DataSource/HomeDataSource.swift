//
//  HomeDataSource.swift
//  InstaCloneTexture
//
//  Created by Jonathan Go on 4/30/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import AsyncDisplayKit

class HomeDataSource: NSObject, ASTableDataSource {
  
  func numberOfSections(in tableNode: ASTableNode) -> Int {
    return 2
  }
  
  func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
    return section == 0 ? 1 : 20
  }
  
  func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
    if indexPath.section == 0 {
      let cell = ASCellNode()
      return cell
    } else {
      let cell = NewsFeedCell()
      return cell
    }
  }
}
