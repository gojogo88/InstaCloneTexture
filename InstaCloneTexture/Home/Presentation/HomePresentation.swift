//
//  HomePresentation.swift
//  InstaCloneTexture
//
//  Created by Jonathan Go on 4/30/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import AsyncDisplayKit

class HomePresentation: BaseNode, ASTableDelegate {
  
  let table = ASTableNode()
  let dataSource = HomeDataSource()
  
  override init() {
    super.init()
    table.allowsSelection = false
    //table.backgroundColor = .red
    table.dataSource = dataSource
    closureSetup()  //has to come first before fetchData
    dataSource.fetchDataFromLocalPath()
  }
  
  
  private func closureSetup() {
    dataSource.reloadTableView = { [weak self] in
      self?.table.reloadData()
    }
  }
  
  //tableView header
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    return ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: table)
  }
  
  //MARK:- Delegate
  // allows you to create dynamic cell heights
  func tableNode(_ tableNode: ASTableNode, constrainedSizeForRowAt indexPath: IndexPath) -> ASSizeRange {
    let width = UIScreen.main.bounds.width
    return ASSizeRangeMake(CGSize(width: width, height: 0), CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
  }
  
  
  
}
