//
//  NewsFeedSocialNode.swift
//  InstaCloneTexture
//
//  Created by Jonathan Go on 4/30/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import AsyncDisplayKit

class NewsFeedSocialNode: BaseNode {
  
  var shareButtonNode = ASButtonNode()
  var commentButtonNode = ASButtonNode()
  var bookmarkButtonNode = ASButtonNode()
  var likeButtonNode = ASButtonNode()
  
  var likesTextNode = ASTextNode()
  var likesCounter: Int? = 10
  
  
  override init() {
    super.init()
    
    setupNode()
  }
  
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let hStackBookmark = ASStackLayoutSpec(
      direction: .horizontal,
        spacing: 0,
        justifyContent: .end,
        alignItems: .end,
        children: [bookmarkButtonNode])
    
    let bookmarkPadding = ASInsetLayoutSpec(
        insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10),
        child: hStackBookmark)
    bookmarkPadding.style.flexGrow = 1
    
    let hStackSocialButtons = ASStackLayoutSpec(
    direction: .horizontal,
      spacing: 10,
      justifyContent: .start,
      alignItems: .stretch,
      children: [likeButtonNode, commentButtonNode, shareButtonNode, bookmarkPadding])
    
    let socialButtonPadding = ASInsetLayoutSpec(insets: .init(top: 10, left: 10, bottom: 10, right: 0), child: hStackSocialButtons)
    var elements = [ASLayoutElement]()
    elements.append(socialButtonPadding)
    
    if let likes = likesCounter, likes > 0 {
      let localInset = ASInsetLayoutSpec(insets: .init(top: 0, left: 10, bottom: 10, right: 0), child: likesTextNode)
      elements.append(localInset)
    }
    
    let vStack = ASStackLayoutSpec(
      direction: .vertical,
        spacing: 6,
        justifyContent: .start,
        alignItems: .stretch,
        children: elements)
    
    return vStack
  }
  
  
  override func asyncTraitCollectionDidChange() {
    super.asyncTraitCollectionDidChange()
    dynamicColours()
  }
  
  private func setupNode() {
    shareButtonNode.style.preferredSize = CGSize(width: 30, height: 30)
    commentButtonNode.style.preferredSize = CGSize(width: 30, height: 30)
    bookmarkButtonNode.style.preferredSize = CGSize(width: 30, height: 30)
    likeButtonNode.style.preferredSize = CGSize(width: 30, height: 30)
    dynamicColours()
  }
  
  
  private func dynamicColours() {
    if let colour = colourSet {
      let imageLike = ASImageNodeTintColorModificationBlock(colour)(UIImage(named: "like")!)
      likeButtonNode.setImage(imageLike, for: .normal)
      let imageShare = ASImageNodeTintColorModificationBlock(colour)(UIImage(named: "share")!)
      shareButtonNode.setImage(imageShare, for: .normal)
      let imageComment = ASImageNodeTintColorModificationBlock(colour)(UIImage(named: "comment")!)
      commentButtonNode.setImage(imageComment, for: .normal)
      let imageBookmark = ASImageNodeTintColorModificationBlock(colour)(UIImage(named: "bookmark")!)
      bookmarkButtonNode.setImage(imageBookmark, for: .normal)
    }
  }
  
  func populate(feed: NewsFeed?) {
    guard let numberOfLikes = feed?.likes else { return }
    let stringValueForLikes = numberOfLikes > 1 ? "\(numberOfLikes) likes" : "\(numberOfLikes) like"
  
    likesTextNode.attributedText = NSAttributedString(string: stringValueForLikes, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.label])
  }
  
  
  
}
