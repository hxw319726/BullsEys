//
//  ViewController.swift
//  BullsEye
//
//  Created by shawvyu on 2018/11/27.
//  Copyright © 2018年 shawvyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var targetLabel:UILabel!
    
    var currentValue:Int = 0
    var targetValue:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound(sliderStarValue:50)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /// 显示滑块数值
    @IBAction func showAlert(){
        
        var difference=currentValue-targetValue
        if(difference){
            difference=currentValue-targetValue
        }else if(currentValue<targetValue){
            difference=targetValue-currentValue
        }else{
            difference=0
        }
        
        let message="滑动条的当前数值是：\(currentValue)" +
            "\n目标数值是： \(targetValue)" +
            "\n两者的差值是： \(difference)"
        let alert=UIAlertController(title: "Hello Messi", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
        startNewRound(sliderStarValue:0)
    }
    
    
    
    /// 读取滑块的数值
    ///
    /// - Parameter slider: 滑块数值
    @IBAction func slideMoved(slider:UISlider){
//         print("滑动条的当前数值是： \(slider.value)")
        currentValue=lroundf(slider.value)
    }
    func startNewRound(sliderStarValue:Int){
        targetValue = 1+Int(arc4random_uniform(100))
        currentValue=sliderStarValue;
        slider.value=Float(currentValue)
        updateLabels()
    }
    func updateLabels() {
        targetLabel.text=String(targetValue)
    }
}

