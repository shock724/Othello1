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
    var white : UIImage? = UIImage(named: "白石.png")
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var startWhite: UIButton!
    @IBOutlet weak var startWhite2: UIButton!
    @IBOutlet weak var startBlack: UIButton!
    @IBOutlet weak var startBlack2: UIButton!
    @IBAction func test(_ sender: UIButton) {
        sender.setImage(black, for: UIControl.State.normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label1.text = "0"
        label2.text = "0"
        label1.layer.borderWidth = 1.0
        label2.layer.borderWidth = 1.0
        startWhite.setImage(white, for: UIControl.State.normal)
        startWhite2.setImage(white, for: UIControl.State.normal)
        
    }


}

