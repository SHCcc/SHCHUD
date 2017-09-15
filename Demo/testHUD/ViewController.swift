//
//  ViewController.swift
//  testHUD
//
//  Created by 邵焕超 on 2017/5/4.
//  Copyright © 2017年 邵焕超. All rights reserved.
//

import UIKit
import SHCHUD

class ViewController: UIViewController {

  let btn = UIButton()
  let btn1 = UIButton()
  let btn2 = UIButton()
  let btn3 = UIButton()
  let btn4 = UIButton()
  let btn5 = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    view.backgroundColor = UIColor.white
    
    setUI()
  }
  
  func setUI() {
    view.addSubview(btn)
    view.addSubview(btn1)
    view.addSubview(btn2)
    view.addSubview(btn3)
    view.addSubview(btn4)
    view.addSubview(btn5)
    
    btn.frame = CGRect(x: 10, y: 210, width: 100, height: 40)
    btn.setTitle("移除", for: .normal)
    btn.setTitleColor(UIColor.black, for: .normal)
    btn.addTarget(self, action: #selector(ViewController.dissmiss), for: .touchUpInside)
    
    btn1.frame = CGRect(x: 10, y: 50, width: 100, height: 40)
    btn1.setTitle("成功", for: .normal)
    btn1.setTitleColor(UIColor.black, for: .normal)
    btn1.addTarget(self, action: #selector(ViewController.success), for: .touchUpInside)
    
    btn2.frame = CGRect(x: 10, y: 90, width: 100, height: 40)
    btn2.setTitle("失败", for: .normal)
    btn2.setTitleColor(UIColor.black, for: .normal)
    btn2.addTarget(self, action: #selector(ViewController.falses), for: .touchUpInside)
    
    btn3.frame = CGRect(x: 10, y: 130, width: 100, height: 40)
    btn3.setTitle("顶部", for: .normal)
    btn3.setTitleColor(UIColor.black, for: .normal)
    btn3.addTarget(self, action: #selector(ViewController.top), for: .touchUpInside)
    
    btn4.frame = CGRect(x: 10, y: 170, width: 100, height: 40)
    btn4.setTitle("底部", for: .normal)
    btn4.setTitleColor(UIColor.black, for: .normal)
    btn4.addTarget(self, action: #selector(ViewController.bottom), for: .touchUpInside)
    
    btn5.frame = CGRect(x: 10, y: 250, width: 100, height: 40)
    btn5.setTitle("图片", for: .normal)
    btn5.setTitleColor(UIColor.black, for: .normal)
    btn5.addTarget(self, action: #selector(ViewController.image), for: .touchUpInside)
  }

  
  @objc func dissmiss() {
    HUD.dissmiss()
    print("dissmiss")
  }
  
  @objc func success() {
    HUD.show(success: "加载成功")
    print("success")
  }
  
  @objc func falses() {
    HUD.show(false: "加载失败")
    print("false")
  }
  
  @objc func top() {
    HUD.showTop(string: "顶部labelSize.heightlabelSize.heightlabelSize.heightlabelSize.height")
    print("顶部通知")
  }
  
  @objc func bottom() {
    HUD.showBottom(string: "底部")
    print("底部")
  }
  
  @objc func image() {
    HUD.showImage(image: UIImage(named: "angle-mask")!)
    print("图片")
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    HUD.show(string: "加载中")
    print("show")
  }
}

