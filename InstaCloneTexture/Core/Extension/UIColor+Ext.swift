//
//  UIColor+Ext.swift
//  InstaCloneTexture
//
//  Created by Jonathan Go on 5/4/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

extension UIColor {
  
  class func colourStringWithHex(hexColor hex: String, withAplpha: CGFloat) -> UIColor {
    var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
      cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
      return .black
    }
    
    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor (
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: CGFloat(withAplpha)
    )
  }
}

