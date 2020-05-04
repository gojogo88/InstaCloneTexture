//
//  StoryFeedNode.swift
//  InstaCloneTexture
//
//  Created by Jonathan Go on 5/1/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import AsyncDisplayKit

class StoryFeedNode: BaseCellNode {
  
  var imageNode = ASNetworkImageNode()
  var nameNode = ASTextNode()
  
  override init() {
    super.init()
    
    setupNode()
  }
  
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let vStack = ASStackLayoutSpec(direction: .vertical, spacing: 6, justifyContent: .start, alignItems: .stretch, children: [imageNode, nameNode])
    return ASCenterLayoutSpec(horizontalPosition: .center, verticalPosition: .center, sizingOption: .minimumSize, child: vStack)
  }
  
  
  private func setupNode() {
    nameNode.maximumNumberOfLines = 1
    imageNode.style.preferredSize = CGSize(width: 60, height: 60)
    imageNode.backgroundColor = .white
    imageNode.cornerRadius = 60 / 2
    imageNode.borderWidth = 2
  }
  
  
  func populate(story: Stories?) {
    nameNode.attributedText = NSAttributedString(string: story?.user?.username ?? "Unknown user", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.label])
    imageNode.url = URL(string: story?.user?.profileImageUrl ?? "")
    imageNode.borderColor = story? .isWatched ?? false ? UIColor.lightGray.cgColor : UIColor.red.cgColor
  }
}
