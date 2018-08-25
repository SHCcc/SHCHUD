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
  
  let textField = UITextField()
  
  let btn = UIButton()
  let btn1 = UIButton()
  let btn2 = UIButton()
  let btn3 = UIButton()
  let btn4 = UIButton()
  let btn5 = UIButton()
  let btn6 = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    view.backgroundColor = UIColor.white
    
    setUI()
  }
  
  func setUI() {
    view.addSubview(textField)
    view.addSubview(btn)
    view.addSubview(btn1)
    view.addSubview(btn2)
    view.addSubview(btn3)
    view.addSubview(btn4)
    view.addSubview(btn5)
    view.addSubview(btn6)
    
    textField.frame = CGRect(x: 120, y: 50, width: 200, height: 40)
    textField.backgroundColor = UIColor.blue
    
    btn.frame = CGRect(x: 10, y: 290, width: 100, height: 40)
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
    
    btn5.frame = CGRect(x: 10, y: 210, width: 100, height: 40)
    btn5.setTitle("图片", for: .normal)
    btn5.setTitleColor(UIColor.black, for: .normal)
    btn5.addTarget(self, action: #selector(ViewController.image), for: .touchUpInside)

    btn6.frame = CGRect(x: 10, y: 250, width: 100, height: 40)
    btn6.setTitle("提示语", for: .normal)
    btn6.setTitleColor(UIColor.black, for: .normal)
    btn6.addTarget(self, action: #selector(ViewController.string), for: .touchUpInside)
}

  
  @objc func dissmiss() {
    HUD.dismiss()
    print("dissmiss")
  }
  
  @objc func success() {
    let str = textField.text!.isEmpty ? "加载成功" : textField.text ?? ""
    HUD.show(success: str, duration: 3.0)
    print("success")
  }
  
  @objc func falses() {
    let str = textField.text!.isEmpty ? "加载失败" : textField.text ?? ""
    HUD.show(false: str)
    print("false")
  }
  
  @objc func top() {
    let str = textField.text!.isEmpty ? "顶部labelSize.heightlabelSize.heightlabelSize.heightlabelSize.height" : textField.text ?? ""
    HUD.showTop(string: str, isShowImage: false)
    print("顶部通知")
  }
  
  @objc func bottom() {
    let str = textField.text!.isEmpty ? "底部" : textField.text ?? ""
    HUD.showBottom(string: str)
    print("底部")
  }
  
  @objc func image() {
    HUD.showImage(image: UIImage(named: "rotation") ?? UIImage())
    print("图片")
  }
  @objc func string() {
    let str = textField.text!.isEmpty ? "加载一会-加载一会加载一会加载一会加载一会加载一会加载一会加载一会加载一会加载一会加载一会" : textField.text ?? ""
    HUD.show(string: str)
    print("show")
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let str = textField.text!.isEmpty ? "加载中" : textField.text ?? ""
    HUD.show(info: str, isShowMask: true)
    print("info")

  }
}


