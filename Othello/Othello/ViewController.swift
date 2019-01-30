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
            
            //0=黒
            if turn == 0{
                
                //押下された場所に黒石を置く
                sender.setImage(black, for: UIControl.State.normal)
                //一行目押下時
                if index! >= 1 && index! <= 6 && index! != 0 && index! != 7 {
                    var rightCount : Int = 1
                    var leftCount : Int = 1
                    var underCount : Int = 8
                    var rightDiagonalCount : Int = 9
                    var leftDiagonalCount : Int = 7
                    //押下箇所の右隣が白かつ一番右端でない場合カウントする
                    while(buttonArray[index! + rightCount].image(for: UIControl.State.normal) == white && index! + rightCount != 7){
                        rightCount += 1
                    }
                    
                    //押下箇所の左隣が白かつ一番左端でない場合カウントする
                    while(buttonArray[index! - leftCount].image(for: UIControl.State.normal) == white && index! + leftCount != 0){
                        leftCount += 1
                    }
                    
                    //押下箇所の下隣が白かつ一番下端でない場合カウントする
                    while(buttonArray[index! + underCount].image(for: UIControl.State.normal) == white && !(index! + underCount >= 57 && index! + underCount <= 62)){
                        underCount += 8
                    }
                    
                    //押下箇所の右下隣が白かつ一番右下端でない場合カウントする
                    while(buttonArray[index! + rightDiagonalCount].image(for: UIControl.State.normal) == white && (index! + rightDiagonalCount) % 8 != 7){
                        underCount += 9
                    }
                    
                    //右端が黒だったら、押下された場所から右端の黒までの白石をひっくり返す
                    if buttonArray[index! + rightCount].image(for: UIControl.State.normal) == black{
                        for i in 1 ... rightCount{
                            buttonArray[index! + i].setImage(black, for: UIControl.State.normal)
                        }
                    }
                    
                    //左端が黒だったら、押下された場所から左端の黒までの白石をひっくり返す
                    if buttonArray[index! - leftCount].image(for: UIControl.State.normal) == black{
                        for j in 1 ... leftCount{
                            buttonArray[index! - j].setImage(black, for: UIControl.State.normal)
                        }
                    }
                    
                    //下端が黒だったら、押下された場所から下端の黒までの白石をひっくり返す
                    if buttonArray[index! + underCount].image(for: UIControl.State.normal) == black{
                        for k in stride(from: 8, to: underCount, by: 8){
                            buttonArray[index! + k].setImage(black, for: UIControl.State.normal)
                        }
                    }
                    
                    //右下端が黒だったら、押下された場所から右下端の黒までの白石をひっくり返す
                    if buttonArray[index! + rightDiagonalCount].image(for: UIControl.State.normal) == black{
                        for l in stride(from: 9, to: rightDiagonalCount, by: 9){
                            buttonArray[index! + l].setImage(black, for: UIControl.State.normal)
                        }
                    }
                    
                    
                    
                }
                
        
                    
                //二行目押下時
                else if index! >= 8 && index! <= 14 && index! != 15 {
                    var count : Int = 1
                    while(buttonArray[index! + count].image(for: UIControl.State.normal) == white && index! + count != 15){
                        count += 1
                    }
                    if buttonArray[index! + count].image(for: UIControl.State.normal) == black{
                        for i in 1 ... count{
                            buttonArray[index! + i].setImage(black, for: UIControl.State.normal)
                        }
                    }
                }
                  
                //三行目押下時
                else if index! >= 16 && index! <= 22 && index! != 23 {
                    var count : Int = 1
                    while(buttonArray[index! + count].image(for: UIControl.State.normal) == white && index! + count != 23){
                        count += 1
                    }
                    if buttonArray[index! + count].image(for: UIControl.State.normal) == black{
                        for i in 1 ... count{
                            buttonArray[index! + i].setImage(black, for: UIControl.State.normal)
                        }
                    }
                }
                    
                //四行目押下時
                else if index! >= 24 && index! <= 30 && index! != 31 {
                    var count : Int = 1
                    while(buttonArray[index! + count].image(for: UIControl.State.normal) == white && index! + count != 31){
                        count += 1
                    }
                    if buttonArray[index! + count].image(for: UIControl.State.normal) == black{
                        for i in 1 ... count{
                            buttonArray[index! + i].setImage(black, for: UIControl.State.normal)
                        }
                    }
                }
                
                //五行目押下時
                else if index! >= 32 && index! <= 38 && index! != 39 {
                    var count : Int = 1
                    while(buttonArray[index! + count].image(for: UIControl.State.normal) == white && index! + count != 39){
                        count += 1
                    }
                    if buttonArray[index! + count].image(for: UIControl.State.normal) == black{
                        for i in 1 ... count{
                            buttonArray[index! + i].setImage(black, for: UIControl.State.normal)
                        }
                    }
                }
                
                //六行目押下時
                else if index! >= 40 && index! <= 46 && index! != 47 {
                    var count : Int = 1
                    while(buttonArray[index! + count].image(for: UIControl.State.normal) == white && index! + count != 47){
                        count += 1
                    }
                    if buttonArray[index! + count].image(for: UIControl.State.normal) == black{
                        for i in 1 ... count{
                            buttonArray[index! + i].setImage(black, for: UIControl.State.normal)
                        }
                    }
                }
                
                //七行目押下時
                else if index! >= 48 && index! <= 54 && index! != 55 {
                    var count : Int = 1
                    while(buttonArray[index! + count].image(for: UIControl.State.normal) == white && index! + count != 55){
                        count += 1
                    }
                    if buttonArray[index! + count].image(for: UIControl.State.normal) == black{
                        for i in 1 ... count{
                            buttonArray[index! + i].setImage(black, for: UIControl.State.normal)
                        }
                    }
                }
                
                //八行目押下時
                else if index! >= 56 && index! <= 62 && index! != 63 {
                    var count : Int = 1
                    while(buttonArray[index! + count].image(for: UIControl.State.normal) == white && index! + count != 63){
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

