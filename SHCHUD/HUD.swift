//
//  HUD.swift
//  testHUD
//
//  Created by 邵焕超 on 2017/5/4.
//  Copyright © 2017年 邵焕超. All rights reserved.
//

import UIKit

enum Status {
  case success // 成功
  case error   // 失败
  case info    // 加载ing
}

enum Notice {
  case top    // 顶部通知
  case string  // 字符串
  case bottom // 底部通知
}

public class HUD: UIView {
  static let sharedView = HUD()
  
  var GCDLock = false
  
  let backView = UIView()
  let imageView = UIImageView()
  let label = UILabel()
  
  var bundle: Bundle {
    get{
      guard let path = Bundle(for: SHCHUD.self).path(forResource: "Photo", ofType: "bundle") else { return Bundle() }
      guard let bundle = Bundle(path: path) else { return Bundle() }
      return bundle
    }
  }
  
  var imageSize = CGSize(width: 50, height: 50)
  var labelSize = CGSize.zero
  
  var rotationAnimation: CABasicAnimation?
  var timer: Timer?
  
  var stopAnimation = false
}

extension HUD {
  fileprivate func buildUI() {
    let windows = UIApplication.shared.keyWindow
    windows?.addSubview(self)
    isUserInteractionEnabled = false
    
    
    let width = (labelSize.width < 110 ? 110 : labelSize.width) + 20
    let height = imageSize.height + labelSize.height + 30
    frame = CGRect(x: (windows!.frame.width - width) / 2, y: (windows!.frame.height - height) / 2, width: width, height: height)
    
    
    layoutIfNeeded()
    buildSubView()
    builLayout()
  }
  
  private func buildSubView() {
    addSubview(backView)
    addSubview(imageView)
    addSubview(label)
    
    backView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
    backView.backgroundColor = UIColor.black
    backView.alpha = 0.7
    backView.layer.cornerRadius = 15
    backView.layer.masksToBounds = true
    
    imageView.tintColor = UIColor.white
    
    label.font = UIFont.systemFont(ofSize: 16)
    label.textColor = UIColor.white
    label.numberOfLines = 0
  }
  
  private func builLayout() {
    buildSubLayout()
  }
  
  private func buildSubLayout() {
    imageView.frame = CGRect(x: (frame.width - imageSize.width) / 2, y: 10, width: imageSize.width, height: imageSize.height)
    label.frame = CGRect(x: (frame.width - labelSize.width) / 2, y: imageView.frame.maxY + 10, width: labelSize.width, height: labelSize.height)
  }
  
  func addAnimation() {
    let animation = CABasicAnimation(keyPath: "transform.rotation.z")
    animation.toValue = NSNumber(floatLiteral: .pi * 2)
    animation.duration = 1.5
    animation.isCumulative = true
    animation.repeatCount = 1000
    imageView.layer.add(animation, forKey: "rotationAnimation")
  }
}

extension HUD {
  fileprivate func buildUI(type: Notice) {
    let windows = UIApplication.shared.keyWindow
    windows?.addSubview(self)
    
    frame = (windows?.frame) ?? CGRect.zero
    layer.masksToBounds = true
    
    addSubview(backView)
    backView.addSubview(imageView)
    backView.addSubview(label)
    
    switch type {
    case .top:
      buildTopView()
    case .string:
      buildMiddleView()
    case .bottom:
      buildBottomView()
    }
  }
  private func buildTopView() {
    frame = CGRect(x: 0, y: UIApplication.shared.statusBarFrame.height, width: frame.width, height: 44)
    backView.frame = CGRect(x: 0, y: -44, width: frame.width, height: 44)
    backView.backgroundColor = UIColor.gray
    backView.layer.cornerRadius = 0
    
    imageView.tintColor = UIColor.black
    
    label.font = UIFont.systemFont(ofSize: 16)
    label.textColor = UIColor.white
    label.numberOfLines = 1
    
    let imageWidth  = imageView.image?.size.width == 0 ? 0 : 25
    let imageHeight = imageView.image?.size.height == 0 ? 0 : 25
    imageView.frame = CGRect(x: 10, y: 10, width: imageWidth, height: imageHeight)
    let x = 10 + imageView.frame.maxX
    let height = labelSize.height > 44 ? 44 : labelSize.height
    let width = UIScreen.main.bounds.width - x
    label.frame = CGRect(x: x, y: (44 - height) / 2, width: width, height: height)
  }
  
  private func buildMiddleView() {
    backView.backgroundColor = UIColor.black
    backView.alpha = 0.7
    backView.layer.cornerRadius = 15
    
    imageView.removeFromSuperview()
    
    label.font = UIFont.systemFont(ofSize: 16)
    label.textColor = UIColor.white
    label.numberOfLines = 0
    
    let width = (labelSize.width < 80 ? 80 : labelSize.width) + 20
    let height = (labelSize.height < 24 ? 24 : labelSize.height) + 20
    let y = (frame.height - height)/2 - 20
    
    frame = CGRect(x: (frame.width - width) / 2, y: y, width: width, height: height)
    backView.frame = CGRect(x: 0, y: 0, width: width, height: height)
    label.frame = CGRect(x: (frame.width - labelSize.width) / 2, y: (frame.height - labelSize.height) / 2, width: labelSize.width, height: labelSize.height)
  }
  
  private func buildBottomView() {
    
    backView.backgroundColor = UIColor.gray
    backView.layer.cornerRadius = 0
    
    imageView.removeFromSuperview()
    
    label.font = UIFont.systemFont(ofSize: 16)
    label.textColor = UIColor.white
    label.numberOfLines = 0
    
    let width = (labelSize.width < 110 ? 110 : labelSize.width) + 10
    let height = labelSize.height + 16
    let y = (frame.height - (height + 100))
    
    frame = CGRect(x: (frame.width - width) / 2, y: y, width: width, height: height)
    backView.frame = CGRect(x: 0, y: 0, width: width, height: height)
    label.frame = CGRect(x: (frame.width - labelSize.width) / 2, y: (frame.height - labelSize.height) / 2, width: labelSize.width, height: labelSize.height)
  }
}


extension HUD {
  /// 开启定时器
  func beginTimer() {
    if timer != nil {
      timer?.invalidate()
      timer = nil
    }
    timer = Timer.scheduledTimer(timeInterval: 1.5,
                                 target: self,
                                 selector: #selector(endTimer),
                                 userInfo: nil,
                                 repeats: true)
    RunLoop.main.add(timer!, forMode: RunLoopMode.commonModes)
  }
  
  @objc func endTimer() {
    dissmiss()
    stopAnimation = false
  }
  
  /// 移除定时器
  func removeTimer() {
    if timer == nil { return }
    timer?.invalidate()
    timer = nil
    stopAnimation = false
  }
}

extension HUD {
  fileprivate func show(status: Status, string: String) {
    if GCDLock { return }
    // 计算文本
    calculateSize(string: string)
    
    switch status {
    case .info:
      removeTimer()
      addAnimation()
      imageView.image = UIImage(named: "rotation.png",
                                in: bundle,
                                compatibleWith: nil)
    case .success:
      imageView.layer.removeAllAnimations()
      beginTimer()
      imageView.image = UIImage(named: "success.png",
                                in: bundle,
                                compatibleWith: nil)
    case .error:
      imageView.layer.removeAllAnimations()
      beginTimer()
      imageView.image = UIImage(named: "error.png",
                                in: bundle,
                                compatibleWith: nil)
    }
    
    // 计算图片
    imageSize = imageView.image?.size ?? CGSize(width: 50, height: 50)
    buildUI()
  }
  
  fileprivate func notice(type :Notice, string: String, isShowImage: Bool = true) {
    if GCDLock { return }
    imageView.layer.removeAllAnimations()
    removeTimer()
    calculateSize(string: string)
    
    switch type {
    case .top:
      var image = UIImage()
      if isShowImage {
        image = UIImage(named: "success.png",
                        in: bundle,
                        compatibleWith: nil)?.withRenderingMode(.alwaysTemplate) ?? UIImage()
        
      }
      imageView.image = image
      buildUI(type: .top)
      self.layoutIfNeeded()
      GCDLock = true
      UIView.animate(withDuration: 0.3,
                     animations: {  [weak self] in
                      guard let base = self else { return }
                      base.backView.frame = CGRect(x: 0, y: 0, width: base.frame.width, height: 44)
        },completion: { (true) in
          let time = DispatchTime.now() + .milliseconds(Int(1 * 1000))
          DispatchQueue.main.asyncAfter(deadline: time) {
            UIView.animate(withDuration: 0.3, animations: { [weak self] in
              guard let base = self else { return }
              if base.stopAnimation { return }
              
              base.backView.frame = CGRect(x: 0, y: -44, width: base.frame.width, height: 44)
              }, completion: { [weak self] (true) in
                guard let base = self else { return }
                base.GCDLock = false
            })
          }
      })
    case .bottom:
      buildUI(type: .bottom)
      beginTimer()
    case .string:
      buildUI(type: .string)
      beginTimer()
    }
  }
  
  fileprivate func showImage(image: UIImage) {
    stopAnimation = true
    imageView.layer.removeAllAnimations()
    imageSize = image.size
    beginTimer()
    imageView.image = image
    label.text = ""
    labelSize = CGSize.zero
    buildUI()
  }
  
  func dissmiss() {
    if self.superview == nil { return }
    self.removeFromSuperview()
    removeTimer()
    HUD.sharedView.removeFromSuperview()
  }
}

extension HUD {
  func calculateSize(string: String) {
    // 计算文本
    let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 16)]
    let option = NSStringDrawingOptions.usesLineFragmentOrigin
    let size = CGSize(width: 300, height: 300)
    let rect = string.boundingRect(with: size, options: option, attributes: attributes, context: nil)
    labelSize = rect.size
    label.text = string
  }
}

public extension HUD {
  public class func show(info status: String) {
    sharedView.show(status: .info, string: status)
  }
  
  public class func show(success status: String) {
    sharedView.show(status: .success ,string: status)
  }
  
  public class func show(false status: String) {
    sharedView.show(status: .error ,string: status)
  }
  
  public class func showTop(string status: String, isShowImage: Bool = true) {
    sharedView.notice(type: .top, string: status, isShowImage: isShowImage)
  }
  
  public class func show(string status: String) {
    sharedView.notice(type: .string, string: status)
  }
  
  public class func showBottom(string status: String) {
    sharedView.notice(type: .bottom, string: status)
  }
  
  public class func showImage(image: UIImage) {
    sharedView.showImage(image: image)
  }
  
  public class func dissmiss() {
    sharedView.dissmiss()
  }
}

