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
  
  
  override func asyncTraitCollectionDidChange() {
    super.asyncTraitCollectionDidChange()
    
    dynamicColour()
  }
  
  private func setup() {
    profileImage.cornerRadius = 36/2
    profileImage.cornerRoundingType = .precomposited
    profileImage.style.preferredSize = CGSize(width: 36, height: 36)
    profileImage.backgroundColor = .white
    
    extraButton.style.preferredSize = CGSize(width: 10, height: 10)
    dynamicColour()
  }
  
  
  private func dynamicColour() {
    if let colour = colourSet {
      let image = ASImageNodeTintColorModificationBlock(colour)(UIImage(named: "ellipsis")!)
      extraButton.setImage(image, for: .normal)
    }
  }
  
  
  func populate(user: User?) {
    profileImage.url = URL(string: user?.profileImageUrl ?? "")
    
    name.attributedText = NSAttributedString(string: user?.username ?? "Unknown User", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor.label])
    
  }
}
