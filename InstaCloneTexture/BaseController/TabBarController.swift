//
//  TabBarController.swift
//  InstaCloneTexture
//
//  Created by Jonathan Go on 5/9/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import AsyncDisplayKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

  let newsFeedController = ViewController()
  let searchController = SearchViewController()
  let imagePickerController = ImagePickerViewController()
  let likedController = LikedViewController()
  let profileController = ProfileViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    setupTabBar()
    tabBarIcon()
    
  }
    
  private func setupTabBar() {
    delegate = self
    tabBar.isTranslucent = false
    tabBar.tintColor = .label
    configureController()
  }
    
  private func tabBarIcon() {
    let icon1 = UITabBarItem(title: "", image: UIImage(named: "homeEmpty"), selectedImage: UIImage(named: "homeFilled"))
    newsFeedController.tabBarItem = icon1
    
    let icon2 = UITabBarItem(title: "", image: UIImage(named: "searchEmpty"), selectedImage: UIImage(named: "searchFilled"))
    searchController.tabBarItem = icon2
    
    let icon3 = UITabBarItem(title: "", image: UIImage(named: "addImageEmpty"), tag: 3)
    imagePickerController.tabBarItem = icon3
    
    let icon4 = UITabBarItem(title: "", image: UIImage(named: "like"), selectedImage: UIImage(named: "likedFilled"))
    likedController.tabBarItem = icon4
    
    let icon5 = UITabBarItem(title: "", image: UIImage(named: "profile")?.withRenderingMode(.alwaysOriginal), tag: 5)
    profileController.tabBarItem = icon5
  }
  
  
  private func configureController() {
    let navigationController1 = ASNavigationController(rootViewController: newsFeedController)
    navigationController1.navigationBar.isTranslucent = false
    
    let navigationController2 = ASNavigationController(rootViewController: searchController)
    navigationController2.navigationBar.isTranslucent = false
    
    let navigationController4 = ASNavigationController(rootViewController: likedController)
    navigationController4.navigationBar.isTranslucent = false
    
    let navigationController5 = ASNavigationController(rootViewController: profileController)
    navigationController5.navigationBar.isTranslucent = false
    
    viewControllers = [navigationController1, navigationController2, imagePickerController, navigationController4, navigationController5]
  }
  
  
  //MARK:- Delegate
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    if viewController.isKind(of: ImagePickerViewController.self) {
      let vc = ImagePickerViewController()
      self.present(vc, animated: true)
      return false
    }
    return true
  }
}
