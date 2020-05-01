//
//  HomeDataSource.swift
//  InstaCloneTexture
//
//  Created by Jonathan Go on 4/30/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import AsyncDisplayKit

class HomeDataSource: NSObject, ASTableDataSource {
  
  private var dataSource: BaseDataSource?
  var reloadTableView: (() -> Void)?
  
  //MARK:- DataSource
  func numberOfSections(in tableNode: ASTableNode) -> Int {
    return 2
  }
  
  func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
    return section == 0 ? 1 : dataSource?.newsFeed?.count ?? 0
  }
  
  
  func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
    return { [weak self] in
      if indexPath.section == 0 {
        let cell = ASCellNode()
        return cell
      } else {
        let feed = self?.dataSource?.newsFeed?[indexPath.row]
        let cell = NewsFeedCell(feed: feed)
        return cell
      }
    }
  }
  
  
  //MARK:- Fetch
  func fetchDataFromLocalPath() {
    dataSource = Bundle.main.decode(BaseDataSource.self, from: "instaClone.json")
    if let _ = dataSource {
      reloadTableView?()
    } else {
      //present alerView can't find data
      fatalError("There is something wrong.")
    }
  }
}
