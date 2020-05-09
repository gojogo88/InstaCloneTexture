//
//  SearchViewController.swift
//  InstaCloneTexture
//
//  Created by Jonathan Go on 5/9/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import AsyncDisplayKit

class SearchViewController: ASViewController<BaseNode> {
  init() {
    super.init(node: BaseNode())
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  //MARK:- View LifCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupNavBar()
  }
  
  
  //MARK:- Private Helpers
  private func setupNavBar() {
    navigationController?.navigationBar.topItem?.title = "Search"
  }
}
