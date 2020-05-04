//
//  StoryFeedDataSource.swift
//  InstaCloneTexture
//
//  Created by Jonathan Go on 5/1/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import AsyncDisplayKit

class StoryFeedDataSource: NSObject, ASCollectionDataSource {
  
  var user: User?
  var unwatchedStories: [Stories]?
  var watchedStories: [Stories]?
  
  
  func setStoriesData(stories: [Stories]?, user: User?) {
    self.watchedStories = stories?.filter({ d in
      d.isWatched == true
    })
    self.unwatchedStories = stories?.filter({ d in
      d.isWatched == false
    })
    self.user = user
  }
  
  func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
    return 3
  }
  
  func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
    if section == 0 {
      return 1
    } else if section == 1 {
      return self.unwatchedStories?.count ?? 0
    } else {
      return self.watchedStories?.count ?? 0
    }
  }
  
  func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
    return { [weak self] in
      if indexPath.section == 0 {
        let cell = UserStoryNode()
        cell.populate(user: self?.user)
        return cell
      } else if indexPath.section == 1 {
        let story = self?.unwatchedStories?[indexPath.item]
        let cell = StoryFeedNode()
        cell.populate(story: story)
        return cell
      } else {
        let story = self?.watchedStories?[indexPath.item]
        let cell = StoryFeedNode()
        cell.populate(story: story)
        return cell
      }
    }
  }
}
