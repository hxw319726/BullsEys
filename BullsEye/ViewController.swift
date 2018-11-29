//
//  ViewController.swift
//  BullsEye
//
//  Created by shawvyu on 2018/11/27.
//  Copyright © 2018年 shawvyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showAlert(){
        let alert=UIAlertController(title: "Hello Russia", message: "梅西上演帽子戏法拯救阿根廷", preferredStyle: .alert)
        let action = UIAlertAction(title: "2018年不再无聊", style: .default, handler: nil)
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
}

