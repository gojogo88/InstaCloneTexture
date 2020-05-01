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
  let newsFeedImageNode = NewsFeedImageNode()
  let newsFeedSocialNode = NewsFeedSocialNode()
  
  var newsFeed: NewsFeed?
  
  init(feed: NewsFeed?){
    super.init()
    self.newsFeed = feed
    populate(feed: self.newsFeed)
  }
  
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let vStack = ASStackLayoutSpec(
        direction: .vertical,
        spacing: 0,
        justifyContent: .start,
        alignItems: .stretch,
        children: [newsFeedUserHeaderNode, newsFeedImageNode, newsFeedSocialNode])
    
    return vStack
  }
  
  
  private func populate(feed: NewsFeed?) {
    newsFeedUserHeaderNode.populate(user: feed?.user)
    newsFeedImageNode.populate(feed: feed)
    newsFeedSocialNode.populate(feed: feed)
  }
}
