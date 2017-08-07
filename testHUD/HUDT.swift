//
//  HUDT.swift
//  testHUD
//
//  Created by 邵焕超 on 2017/5/22.
//  Copyright © 2017年 邵焕超. All rights reserved.
//

import UIKit

class HUDT: UIView {
  static let sharedView = HUDT()
  
  var GCDLock = false
  
  let imageView = UIImageView()
  let label = UILabel()
  let backView = UIView()
  
  let progressView = ProgressView()
  
  var imageSize = CGSize(width: 50, height: 50)
  var labelSize = CGSize.zero
  var backSize = CGSize.zero
  
  var timer: Timer?
}

extension HUDT {
  func buildTopUI() {
    buildUI()
  }
  
  func buildMiddleUI () {
    buildUI()
  }
  
  func buildBottomUI() {
    buildUI()
  }
  
  func buildUI() {
    let windows = UIApplication.shared.keyWindow
    windows?.addSubview(self)
    
    isUserInteractionEnabled = false
    layer.masksToBounds = true
    
    addSubview(backView)
    backView.addSubview(imageView)
    backView.addSubview(label)
    
    backView.backgroundColor = UIColor.gray
    backView.layer.cornerRadius = 0
    
    imageView.tintColor = UIColor.white
    
    label.font = UIFont.systemFont(ofSize: 16)
    label.textColor = UIColor.white
    label.numberOfLines = 1
  }
}

extension HUDT {
  func setTopFrame() {
    
  }
  
  func setMiddleFrame() {
    let width = (labelSize.width < 110 ? 110 : labelSize.width) + 20
    let height = imageSize.height + labelSize.height + 30
    frame = CGRect(x: (UIScreen.main.bounds.width - width) / 2, y: (UIScreen.main.bounds.height - height) / 2, width: width, height: height)
    
    backView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
    
    imageView.frame = CGRect(x: (frame.width - imageSize.width) / 2, y: 10, width: imageSize.width, height: imageSize.height)
    
    label.frame = CGRect(x: (frame.width - labelSize.width) / 2, y: imageView.frame.maxY + 10, width: labelSize.width, height: labelSize.height)
  }
  
  func setBottomFrame() {
    
  }
}

