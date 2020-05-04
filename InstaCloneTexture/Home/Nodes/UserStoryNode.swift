//
//  UserStoryNode.swift
//  InstaCloneTexture
//
//  Created by Jonathan Go on 5/4/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import AsyncDisplayKit

class UserStoryNode: StoryFeedNode {
  var addButtonNode = ASButtonNode()
  
  override init() {
    super.init()
    
    setupNode()
  }
  
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let cornerSpec = ASCornerLayoutSpec(child: imageNode, corner: addButtonNode, location: .bottomRight)
    cornerSpec.offset = CGPoint(x: -10, y: -10)
    return ASStackLayoutSpec(direction: .vertical, spacing: 6, justifyContent: .start, alignItems: .center, children: [cornerSpec, nameNode])
  }
  
  
  func populate(user: User?) {
    imageNode.url = URL (string: user?.profileImageUrl ?? "")
    nameNode.attributedText = NSAttributedString(string: user?.username ?? "Unknown User", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.label])
  }
  
  
  private func setupNode() {
    addButtonNode.backgroundColor = UIColor.colourStringWithHex(hexColor: "00008b", withAplpha: 1)
    addButtonNode.setTitle("+", with: UIFont.boldSystemFont(ofSize: 16), with: .white, for: .normal)
    addButtonNode.borderWidth = 1.5
    addButtonNode.borderColor = UIColor.white.cgColor
    addButtonNode.style.preferredSize = CGSize (width: 20, height: 20)
    addButtonNode.cornerRadius = 20/2
  }
}
