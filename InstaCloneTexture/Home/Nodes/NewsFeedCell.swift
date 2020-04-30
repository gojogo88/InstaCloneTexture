//
//  NewsFeedCell.swift
//  InstaCloneTexture
//
//  Created by Jonathan Go on 4/30/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import AsyncDisplayKit

class NewsFeedCell: BaseCellNode {
  
  let newsFeedUserHeaderNode = NewsFeedUserHeaderNode()
  
  override init(){
    super.init()
  }
  
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let vStack = ASStackLayoutSpec(
        direction: .vertical,
        spacing: 0,
        justifyContent: .start,
        alignItems: .stretch,
        children: [newsFeedUserHeaderNode])
    
    return vStack
  }
}
