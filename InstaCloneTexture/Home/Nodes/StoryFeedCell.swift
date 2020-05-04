//
//  StoryFeedCell.swift
//  InstaCloneTexture
//
//  Created by Jonathan Go on 5/1/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import AsyncDisplayKit

class StoryFeedCell: BaseCellNode, ASCollectionDelegate {
  
  var dataSource = StoryFeedDataSource()
  let width = UIScreen.main.bounds.width
  
  var collectionNode: ASCollectionNode = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.itemSize = CGSize(width: 60, height: 60)
    flowLayout.scrollDirection = .horizontal
    flowLayout.minimumLineSpacing = 10
    let collectionNode = ASCollectionNode(collectionViewLayout: flowLayout)
    collectionNode.backgroundColor = .clear
    return collectionNode
  }()
  
  init(stories: [Stories]?, user: User?) {
    super.init()
    
    setupNodes(stories: stories, user: user)
  }
  
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    return ASInsetLayoutSpec(insets: .zero, child: collectionNode)
  }
  
  
  private func setupNodes(stories: [Stories]?, user: User?) {
    collectionNode.dataSource = dataSource
    collectionNode.delegate = self
    collectionNode.style.preferredSize = CGSize(width: width, height: 100)
    
    dataSource.setStoriesData(stories: stories, user: user)
  }
  
  
  //MARK:- Delegate
  func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
    return ASSizeRangeMake(CGSize(width: 80, height: 0), CGSize(width: 80, height: CGFloat.greatestFiniteMagnitude))
  }
}
