//
//  ViewController.swift
//  InstaCloneTexture
//
//  Created by Jonathan Go on 4/30/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import AsyncDisplayKit

class ViewController: ASViewController<BaseNode> {

  var newsFeed: HomePresentation!
  
  init() {
    super.init(node: BaseNode())
    newsFeed = HomePresentation()
    self.node.addSubnode(newsFeed)
    self.node.backgroundColor = .white
    
    self.node.layoutSpecBlock = { (node, contrainedSize) in
      return ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: self.newsFeed)
    }
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
    navigationController?.navigationBar.topItem?.title = "InstaClone"
  }
  
  
  

}

