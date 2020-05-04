//
//  NewsFeedLastCommentNode.swift
//  InstaCloneTexture
//
//  Created by Jonathan Go on 5/1/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import AsyncDisplayKit

class NewsFeedLastCommentNode: BaseNode {
  
  var imageNode = ASNetworkImageNode()
  var nameNode = ASTextNode()
  var commentNode = ASTextNode()
  
  override init() {
    super.init()
    
    setupNode()
  }
  
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let vStack = ASStackLayoutSpec(direction: .vertical, spacing: 6, justifyContent: .start, alignItems: .stretch, children: [nameNode, commentNode])
    vStack.style.flexGrow = 1
    vStack.style.flexShrink = 1
    let hStack = ASStackLayoutSpec(direction: .horizontal, spacing: 6, justifyContent: .start, alignItems: .stretch, children: [imageNode, vStack])
    
    return ASInsetLayoutSpec(insets: .init(top: 10, left: 10, bottom: 10, right: 10), child: hStack)
  }
  
  
  private func setupNode() {
    imageNode.style.preferredSize = CGSize(width: 20, height: 20)
    imageNode.cornerRadius = 20/2
    imageNode.backgroundColor = .white
  }
  
  
  func populate(feed: NewsFeed?) {
    nameNode.attributedText = NSAttributedString(string: feed?.lastComment?.user?.username ?? "Unknown User", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.label])
    commentNode.attributedText = NSAttributedString(string: feed?.lastComment?.comment ?? "", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.label])
    imageNode.url = URL(string: feed?.lastComment?.user?.profileImageUrl ?? "")
  }
  
}
