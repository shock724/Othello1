//
//  ViewController.swift
//  Othello
//
//  Created by route02 on 2019/01/12.
//  Copyright © 2019年 Shock. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var black : UIImage? = UIImage(named: "黒石.png")
    @IBOutlet weak var label1: UILabel!
    @IBAction func test(_ sender: UIButton) {
        sender.setImage(black, for: UIControl.State.normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label1.text = ""
        label1.layer.borderWidth = 1.0
        
    }


}

