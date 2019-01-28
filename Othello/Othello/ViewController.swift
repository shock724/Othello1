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
    var turn : Int = 0
    @IBOutlet var buttonArray: [UIButton] = []
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var startWhite: UIButton!
    @IBOutlet weak var startWhite2: UIButton!
    @IBOutlet weak var startBlack: UIButton!
    @IBOutlet weak var startBlack2: UIButton!
    @IBAction func test(_ sender: UIButton) {
        let index = buttonArray.index(of: sender)
        print(index)
        
        if sender.image(for: UIControl.State.normal) == nil{
            
            if turn == 0{
                sender.setImage(black, for: UIControl.State.normal)
                if index! >= 0 && index! <= 6 && index! != 7 {
                    var count : Int = 1
                    while(buttonArray[index! + count].image(for: UIControl.State.normal) == white && index! + count != 7){
                        count += 1
                    }
                    
                    if buttonArray[index! + count].image(for: UIControl.State.normal) == black{
                        for i in 1 ... count{
                            buttonArray[index! + i].setImage(black, for: UIControl.State.normal)
                        }
                    }
                }
                
                if index! >= 8 && index! <= 14 && index! != 15 {
                    var count : Int = 8
                    while(buttonArray[index! + count].image(for: UIControl.State.normal) == white && index! + count != 15){
                        count += 1
                    }
                    if buttonArray[index! + count].image(for: UIControl.State.normal) == black{
                        for i in 1 ... count{
                            buttonArray[index! + i].setImage(black, for: UIControl.State.normal)
                        }
                    }
                }
                    
                if index! >= 16 && index! <= 22 && index! != 23 {
                    var count : Int = 16
                    while(buttonArray[index! + count].image(for: UIControl.State.normal) == white && index! + count != 23){
                        count += 1
                    }
                    if buttonArray[index! + count].image(for: UIControl.State.normal) == black{
                        for i in 1 ... count{
                            buttonArray[index! + i].setImage(black, for: UIControl.State.normal)
                        }
                    }
                }
                
                if index! >= 24 && index! <= 30 && index! != 31 {
                    var count : Int = 24
                    while(buttonArray[index! + count].image(for: UIControl.State.normal) == white && index! + count != 31){
                        count += 1
                    }
                    if buttonArray[index! + count].image(for: UIControl.State.normal) == black{
                        for i in 1 ... count{
                            buttonArray[index! + i].setImage(black, for: UIControl.State.normal)
                        }
                    }
                }
                
                
                
                turn += 1
            }
                
                
                
            else if turn == 1{
                sender.setImage(white, for: UIControl.State.normal)
                if index! != 7 {
                    var count : Int = 1
                    while(buttonArray[index! + count].image(for: UIControl.State.normal) == black && index! + count != 7){
                        count += 1
                    }
                    
                    if buttonArray[index! + count].image(for: UIControl.State.normal) == white{
                        for i in 1 ... count{
                            buttonArray[index! + i].setImage(white, for: UIControl.State.normal)
                        }
                    }
                    
                }
                turn = 0
            }
            
        }
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
        startBlack.setImage(black, for: UIControl.State.normal)
        startBlack2.setImage(black, for: UIControl.State.normal)
        
    }


}

