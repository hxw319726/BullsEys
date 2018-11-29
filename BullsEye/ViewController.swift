//
//  ViewController.swift
//  BullsEye
//
//  Created by shawvyu on 2018/11/27.
//  Copyright © 2018年 shawvyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue:Int=50
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /// 显示滑块数值
    @IBAction func showAlert(){
        let message="滑动条的当前数值是：\(currentValue)"
        let alert=UIAlertController(title: "Hello Messi", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
    
    
    /// 读取滑块的数值
    ///
    /// - Parameter slider: 滑块数值
    @IBAction func slideMoved(slider:UISlider){
//         print("滑动条的当前数值是： \(slider.value)")
        currentValue=lroundf(slider.value)
    }
}

