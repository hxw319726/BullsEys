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
    @IBOutlet weak var scoreLabel:UILabel!
    @IBOutlet weak var roundLabel:UILabel!
    
    var currentValue:Int = 0
    var targetValue:Int = 0
    // 分数
    var score=0
    // round数
    var round=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        //设置滑动条的外观
//        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizeable = trackLeftImage.resizableImage(withCapInsets: insets)
        
        slider.setMinimumTrackImage(trackLeftResizeable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizeable = trackRightImage.resizableImage(withCapInsets: insets)
        
        slider.setMaximumTrackImage(trackRightResizeable, for: .normal)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /// 显示滑块数值
    @IBAction func showAlert(){
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        //添加以下代码对玩家的表现作出评价~
        let title:String
        if difference==0 {
            title = "运气逆天！赶紧去买注彩票吧！"
            points+=100
        }else if difference < 5 {
            title = "太棒了！差一点就到了！"
            if difference==1 {
                points+=50
            }
        }else if difference < 10 {
            title = "很不错！继续努力！"
        }else {
            title = "差太远了，君在长江头，我在长江尾~"
        }
        // 计算分数
        score+=points
        let message="大家好，给大家介绍一下我的得分，是 \(points) 分"
        let alert=UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {action in self.startNewRound(sliderStarValue: 50)})
        alert.addAction(action)
        // 使用以下代码呈现提示对话框
        present(alert,animated: true,completion: nil)
    }
    
    
    
    /// 读取滑块的数值
    ///
    /// - Parameter slider: 滑块数值
    @IBAction func slideMoved(slider:UISlider){
        currentValue=lroundf(slider.value)
    }
    
    @IBAction func startOver(){
        startNewGame()
    }

    ///  开启新的游戏回合
    ///
    /// - Parameter sliderStarValue: 滑块开始值
    func startNewRound(sliderStarValue:Int){
        targetValue = 1+Int(arc4random_uniform(100))
        currentValue=sliderStarValue;
        slider.value=Float(currentValue)
        round+=1
        updateLabels()
    }
    
    /// 更新Label
    func updateLabels() {
        targetLabel.text=String(targetValue)
        scoreLabel.text=String(score)
        roundLabel.text=String(round)
    }
    
    func startNewGame(){
        score=0
        round=0
        startNewRound(sliderStarValue: 50)
    }
}

