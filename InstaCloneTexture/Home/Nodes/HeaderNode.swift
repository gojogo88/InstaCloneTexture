//
//  HeaderNode.swift
//  InstaCloneTexture
//
//  Created by Jonathan Go on 4/30/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import AsyncDisplayKit

class NewsFeedUserHeaderNode: BaseNode {
  
  var profileImage = ASNetworkImageNode()
  var name = ASTextNode()
  var extraButton = ASButtonNode()
  
  override init() {
    super.init()
    
    setup()
  }
  
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let leftPadding = ASInsetLayoutSpec(
        insets: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 0),
        child: profileImage)
    
    let iconSpec = ASStackLayoutSpec(
      direction: .horizontal,
        spacing: 0,
        justifyContent: .end,
        alignItems: .end,
        children: [extraButton])
    
    let rightPadding = ASInsetLayoutSpec(
        insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16),
        child: iconSpec)
    rightPadding.style.flexGrow = 1
    
    let finalSpec = ASStackLayoutSpec(
        direction: .horizontal,
        spacing: 10,
        justifyContent: .start,
        alignItems: .center,
        children: [leftPadding, name, rightPadding])
    
    return finalSpec
  }
  
  private func setup() {
    profileImage.backgroundColor = .green
    profileImage.cornerRadius = 36/2
    profileImage.style.preferredSize = CGSize(width: 36, height: 36)
    
    name.attributedText = NSAttributedString(string: "Texture is cool")
    
    let image = ASImageNodeTintColorModificationBlock(.black)(UIImage(named: "ellipsis")!)
    extraButton.setImage(image, for: .normal)
    extraButton.style.preferredSize = CGSize(width: 10, height: 10)
  }
}
