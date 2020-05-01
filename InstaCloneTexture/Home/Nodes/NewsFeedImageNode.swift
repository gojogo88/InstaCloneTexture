//
//  NewsFeedImageNode.swift
//  InstaCloneTexture
//
//  Created by Jonathan Go on 4/30/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import AsyncDisplayKit

class NewsFeedImageNode: BaseNode {
  
  var imageNode = ASNetworkImageNode()
  
  override init() {
    super.init()
    
    setupNode()
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    return ASInsetLayoutSpec(insets: .zero, child: imageNode)
  }
  
  private func setupNode() {
    imageNode.style.preferredSize.width = UIScreen.main.bounds.width
  }
  
  
  func populate(feed: NewsFeed?) {
    imageNode.url = URL(string: feed?.imageUrl ?? "")
    imageNode.style.preferredSize.height = UIScreen.main.bounds.width * CGFloat(feed?.aspectRatio ?? 1)

  }
}
