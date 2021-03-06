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
        print(index!)
        
        if sender.image(for: UIControl.State.normal) == nil{
            
            //0=黒
            if turn == 0{
                //押下された場所に黒石を置く
                //sender.setImage(black, for: UIControl.State.normal)
                //一行目
                //if index! >= 1 && index! <= 6 && index! != 0 && index! != 7 {
                    var rightCount : Int = 1
                    var leftCount : Int = 1
                    var overCount : Int = 8
                    var underCount : Int = 8
                    var rightUnderDiagonalCount : Int = 9
                    var rightOverDiagonalCount : Int = 7
                    var leftUnderDiagonalCount : Int = 7
                    var leftOverDiagonalCount : Int = 9
                    var putFrug : Int = 0
                    //押下箇所の右隣が白かつ、押下された場所の右隣が一番右でない場合、下記の条件を満たすまでカウントする
                    if index! + rightCount >= 0 && index! + rightCount <= 63{
                        while(buttonArray[index! + rightCount].image(for: UIControl.State.normal) == white && (index! + rightCount) % 8 != 7){
                            rightCount += 1
                        }
                    }
                    
                    //押下箇所の左隣が白かつ、押下された場所の左隣が一番左でない場合、下記の条件を満たすまでカウントする
                    if index! - leftCount >= 0 && index! - leftCount <= 63{
                        while(buttonArray[index! - leftCount].image(for: UIControl.State.normal) == white && (index! - leftCount) % 8 != 0){
                            leftCount += 1
                        }
                    }
                
                    //押下箇所の下隣が白かつ、押下された場所の下隣が一番下でない場合、下記の条件を満たすまでカウントする
                    if (index! + underCount >= 0 && index! + underCount <= 63) && !(56...63 ~= index!){
                       while(buttonArray[index! + underCount].image(for: UIControl.State.normal) == white && !(index! + underCount >= 56 && index! + underCount <= 63)) {
                           underCount += 8
                       }
                    }
                
                    //押下箇所の上隣が白かつ、押下された場所の上隣が一番上でない場合、下記の条件を満たすまでカウントする
                    if (index! + overCount >= 0 && index! - overCount <= 63) && !(0...14 ~= index!){
                        while(buttonArray[index! - overCount].image(for: UIControl.State.normal) == white && !(0...7 ~= index!)){
                            overCount += 8
                        }
                    }
                
                    //押下箇所の右下隣が白かつ、押下された場所の右下隣が一番右と一番下でない場合、下記の条件を満たすまでカウントする
                    if (index! + rightUnderDiagonalCount >= 0 && index! + rightUnderDiagonalCount <= 63) && !(48...63 ~= index!){
                        while(buttonArray[index! + rightUnderDiagonalCount].image(for: UIControl.State.normal) == white && (index! + rightUnderDiagonalCount) % 8 != 7){
                            rightUnderDiagonalCount += 9
                                if index! + rightUnderDiagonalCount >= 63{
                                    break
                                }
                        }
                    }
                    
                    //押下箇所の左下隣が白かつ、押下された場所の左下隣が一番左端でない場合、下記の条件を満たすまでカウントする
                    if (index! + leftUnderDiagonalCount >= 0 && index! + leftUnderDiagonalCount <= 63) && !(48...63 ~= index!){
                        while(buttonArray[index! + leftUnderDiagonalCount].image(for: UIControl.State.normal) == white && (index! + leftUnderDiagonalCount) % 8 != 0){
                            leftUnderDiagonalCount += 7
                                if index! + leftUnderDiagonalCount >= 63{
                                    break
                                }
                        }
                    }
                
                    //押下箇所の右上隣が白かつ、押下された場所の右上隣が一番右端でない場合、下記の条件を満たすまでカウントする
                    if index! - rightOverDiagonalCount >= 0 && index! - rightOverDiagonalCount <= 63 && !(0...14 ~= index!){
                       while(buttonArray[index! - rightOverDiagonalCount].image(for: UIControl.State.normal) == white && (index! - rightOverDiagonalCount) % 8 != 7){
                           rightOverDiagonalCount += 7
                                if index! + rightOverDiagonalCount <= 0{
                                    break
                                }
                       }
                    }
                
                    //押下箇所の左上隣が白かつ、押下された場所の左上隣が一番左端でない場合、下記の条件を満たすまでカウントする
                    if index! - leftOverDiagonalCount >= 0 && index! - leftOverDiagonalCount <= 63 && !(0...14 ~= index!){
                        while(buttonArray[index! - leftOverDiagonalCount].image(for: UIControl.State.normal) == white && (index! - leftOverDiagonalCount) % 8 != 0){
                            leftOverDiagonalCount += 9
                                if index! + leftOverDiagonalCount <= 0{
                                    break
                                }

                        }
                    }
                
                
                    //右端が黒だったら、押下された場所から右端の黒までの白石をひっくり返す
                    if index! + rightCount >= 0 && index! + rightCount <= 63{
                        if buttonArray[index! + rightCount].image(for: UIControl.State.normal) == black{
                            if buttonArray[index! + 1].image(for: UIControl.State.normal) == white {
                                putFrug = 1
                            }
                            for i in 1 ... rightCount{
                                buttonArray[index! + i].setImage(black, for: UIControl.State.normal)
                            }
                        }
                    }
                    
                    //左端が黒だったら、押下された場所から左端の黒までの白石をひっくり返す
                    if index! - leftCount >= 0 && index! - leftCount <= 63{
                        if buttonArray[index! - leftCount].image(for: UIControl.State.normal) == black{
                            if buttonArray[index! - 1].image(for: UIControl.State.normal) == white {
                                putFrug = 1
                            }
                            for j in 1 ... leftCount{
                                buttonArray[index! - j].setImage(black, for: UIControl.State.normal)
                            }
                        }
                    }
                
                    //上端が黒だったら、押下された場所から上端の黒までの白石をひっくり返す
                    if (index! + overCount >= 0 && index! - overCount <= 63) && !(0...14 ~= index!){
                        if buttonArray[index! - overCount].image(for: UIControl.State.normal) == black{
                            for k in stride(from: 8, to: overCount, by: 8){
                                buttonArray[index! - k].setImage(black, for: UIControl.State.normal)
                                putFrug = 1
                            }
                            
                        }
                    }
                
                    //下端が黒だったら、押下された場所から下端の黒までの白石をひっくり返す
                    if (index! + underCount >= 0 && index! + underCount <= 63) && !(48...63 ~= index!){
                        if buttonArray[index! + underCount].image(for: UIControl.State.normal) == black{
                            for l in stride(from: 8, to: underCount, by: 8){
                                buttonArray[index! + l].setImage(black, for: UIControl.State.normal)
                                putFrug = 1
                            }
                            
                        }
                    }
                    
                    //右下端が黒だったら、押下された場所から右下端の黒までの白石をひっくり返す
                    if (index! + rightUnderDiagonalCount >= 0 && index! + rightUnderDiagonalCount <= 63) && !(48...63 ~= index!){
                        if buttonArray[index! + rightUnderDiagonalCount].image(for: UIControl.State.normal) == black{
                            for m in stride(from: 9, to: rightUnderDiagonalCount, by: 9){
                                buttonArray[index! + m].setImage(black, for: UIControl.State.normal)
                                putFrug = 1
                            }
                            
                        }
                    }
                    
                    //左下端が黒だったら、押下された場所から左下端の黒までの白石をひっくり返す
                    if (index! + leftUnderDiagonalCount >= 0 && index! + leftUnderDiagonalCount <= 63) && !(48...63 ~= index!){
                        if buttonArray[index! + leftUnderDiagonalCount].image(for: UIControl.State.normal) == black{
                            for n in stride(from: 7, to: leftUnderDiagonalCount, by: 7){
                                buttonArray[index! + n].setImage(black, for: UIControl.State.normal)
                                putFrug = 1
                            }
                        }
                    }
                    
                    //右上端が黒だったら、押下された場所から右上端の黒までの白石をひっくり返す
                    if index! - rightOverDiagonalCount >= 0 && index! - rightOverDiagonalCount <= 63 && !(0...14 ~= index!){
                        if buttonArray[index! - rightOverDiagonalCount].image(for: UIControl.State.normal) == black{
                            for o in stride(from: 7, to: rightOverDiagonalCount, by: 7){
                                buttonArray[index! - o].setImage(black, for: UIControl.State.normal)
                                putFrug = 1
                            }
                            
                        }
                    }
                     
                    //左上端が黒だったら、押下された場所から左上端の黒までの白石をひっくり返す
                    if index! - leftOverDiagonalCount >= 0 && index! - leftOverDiagonalCount <= 63 && !(0...14 ~= index!){
                        if buttonArray[index! - leftOverDiagonalCount].image(for: UIControl.State.normal) == black{
                            for p in stride(from: 9, to: leftOverDiagonalCount, by: 9){
                                buttonArray[index! - p].setImage(black, for: UIControl.State.normal)
                                putFrug = 1
                            }
                            
                        }
                    }
                
                if putFrug == 1 {
                    //押下された場所に黒石を置く
                    sender.setImage(black, for: UIControl.State.normal)
                    putFrug = 0
                    turn += 1
                    label1.text = "白"
                }
                
            }
                
                
                
                
                
            else if turn == 1{
                    var rightCount : Int = 1
                    var leftCount : Int = 1
                    var overCount : Int = 8
                    var underCount : Int = 8
                    var rightUnderDiagonalCount : Int = 9
                    var rightOverDiagonalCount : Int = 7
                    var leftUnderDiagonalCount : Int = 7
                    var leftOverDiagonalCount : Int = 9
                    var putFrug : Int = 0
                    //押下箇所の右隣が黒かつ、押下された場所の右隣が一番右でない場合、下記の条件を満たすまでカウントする
                    if index! + rightCount >= 0 && index! + rightCount <= 63{
                        while(buttonArray[index! + rightCount].image(for: UIControl.State.normal) == black && (index! + rightCount) % 8 != 7){
                            rightCount += 1
                        }
                    }
                
                    //押下箇所の左隣が黒かつ、押下された場所の左隣が一番左でない場合、下記の条件を満たすまでカウントする
                    if index! - leftCount >= 0 && index! - leftCount <= 63{
                        while(buttonArray[index! - leftCount].image(for: UIControl.State.normal) == black && (index! - leftCount) % 8 != 0){
                            leftCount += 1
                        }
                    }
                
                    //押下箇所の下隣が黒かつ、押下された場所の下隣が一番下でない場合、下記の条件を満たすまでカウントする
                    if (index! + underCount >= 0 && index! + underCount <= 63) && !(48...63 ~= index!){
                        while(buttonArray[index! + underCount].image(for: UIControl.State.normal) == black && !(index! + underCount >= 56 && index! + underCount <= 63)){
                            underCount += 8
                        }
                    }
                
                    //押下箇所の上隣が黒かつ、押下された場所の上隣が一番上でない場合、下記の条件を満たすまでカウントする
                    if index! + overCount >= 0 && index! - overCount <= 63 && !(0...14 ~= index!){
                        while(buttonArray[index! - overCount].image(for: UIControl.State.normal) == black && !(0...7 ~= index! - overCount)){
                            overCount += 8
                        }
                    }
                
                    //押下箇所の右下隣が黒かつ、押下された場所の右下隣が一番右と一番下でない場合、下記の条件を満たすまでカウントする
                    if (index! + rightUnderDiagonalCount >= 0 && index! + rightUnderDiagonalCount <= 63) && !(48...63 ~= index!){
                        while(buttonArray[index! + rightUnderDiagonalCount].image(for: UIControl.State.normal) == black && (index! + rightUnderDiagonalCount) % 8 != 7){
                            rightUnderDiagonalCount += 9
                                if index! + rightUnderDiagonalCount >= 63{
                                    break
                                }
                        }
                    }
                        
                    //押下箇所の左下隣が黒かつ、押下された場所の左下隣が一番左下でない場合、下記の条件を満たすまでカウントする
                    if (index! + leftUnderDiagonalCount >= 0 && index! + leftUnderDiagonalCount <= 63) && !(48...63 ~= index!){
                        while(buttonArray[index! + leftUnderDiagonalCount].image(for: UIControl.State.normal) == black && (index! + leftUnderDiagonalCount) % 8 != 0){
                            leftUnderDiagonalCount += 7
                                if index! + leftUnderDiagonalCount >= 63{
                                    break
                                }
                        }
                    }
                
                    //押下箇所の右上隣が黒かつ、押下された場所の右上隣が一番右端でない場合、下記の条件を満たすまでカウントする
                    if (index! + rightOverDiagonalCount >= 0 && index! - rightOverDiagonalCount <= 63) && !(0...14 ~= index!){
                        while(buttonArray[index! - rightOverDiagonalCount].image(for: UIControl.State.normal) == black && (index! - rightOverDiagonalCount) % 8 != 7){
                            rightOverDiagonalCount += 7
                                if index! + rightOverDiagonalCount <= 0{
                                    break
                                }
                        }
                    }
                
                    //押下箇所の左上隣が黒かつ、押下された場所の左上隣が一番左端でない場合、下記の条件を満たすまでカウントする
                    if (index! + leftOverDiagonalCount >= 0 && index! - leftOverDiagonalCount <= 63) && !(0...14 ~= index!){
                        while(buttonArray[index! - leftOverDiagonalCount].image(for: UIControl.State.normal) == black && (index! - leftOverDiagonalCount) % 8 != 7){
                            leftOverDiagonalCount += 9
                                if index! - leftOverDiagonalCount <= 0{
                                    break
                                }
                        }
                    }
                
                
                    //右端が白だったら、押下された場所から右端の白までの黒石をひっくり返す
                    if index! + rightCount >= 0 && index! + rightCount <= 63{
                        if buttonArray[index! + rightCount].image(for: UIControl.State.normal) == white{
                            if buttonArray[index! + 1].image(for: UIControl.State.normal) == black {
                                putFrug = 1
                            }
                            for i in 1 ... rightCount{
                                buttonArray[index! + i].setImage(white, for: UIControl.State.normal)
                            }
                        }
                    }
                
                    //左端が白だったら、押下された場所から左端の白までの黒石をひっくり返す
                    if index! - leftCount >= 0 && index! - leftCount <= 63{
                        if buttonArray[index! - leftCount].image(for: UIControl.State.normal) == white{
                            if buttonArray[index! - 1].image(for: UIControl.State.normal) == black {
                                putFrug = 1
                            }
                            for j in 1 ... leftCount{
                                buttonArray[index! - j].setImage(white, for: UIControl.State.normal)
                            }
                        }
                    }
                
                    //上端が白だったら、押下された場所から上端の白までの黒石をひっくり返す
                    if index! + overCount >= 0 && index! - overCount <= 63 && !(0...14 ~= index!){
                        if buttonArray[index! - overCount].image(for: UIControl.State.normal) == white{
                            for k in stride(from: 8, to: overCount, by: 8){
                                buttonArray[index! - k].setImage(white, for: UIControl.State.normal)
                                putFrug = 1
                            }
                            
                        }
                    }
                
                    //下端が白だったら、押下された場所から下端の白までの黒石をひっくり返す
                    if (index! + underCount >= 0 && index! + underCount <= 63) && !(48...63 ~= index!){
                        if buttonArray[index! + underCount].image(for: UIControl.State.normal) == white{
                            for l in stride(from: 8, to: underCount, by: 8){
                                buttonArray[index! + l].setImage(white, for: UIControl.State.normal)
                                putFrug = 1
                            }
                            
                        }
                    }
                
                    //右下端が白だったら、押下された場所から右下端の白までの黒石をひっくり返す
                    if (index! + rightUnderDiagonalCount >= 0 && index! + rightUnderDiagonalCount <= 63) && !(48...63 ~= index!){
                        if buttonArray[index! + rightUnderDiagonalCount].image(for: UIControl.State.normal) == white{
                            for m in stride(from: 9, to: rightUnderDiagonalCount, by: 9){
                                buttonArray[index! + m].setImage(white, for: UIControl.State.normal)
                                putFrug = 1
                            }
                            
                        }
                    }
                
                    //左下端が白だったら、押下された場所から左下端の白までの黒石をひっくり返す
                    if (index! + leftUnderDiagonalCount >= 0 && index! + leftUnderDiagonalCount <= 63) && !(48...63 ~= index!){
                        if buttonArray[index! + leftUnderDiagonalCount].image(for: UIControl.State.normal) == white{
                            for n in stride(from: 7, to: leftUnderDiagonalCount, by: 7){
                                buttonArray[index! + n].setImage(white, for: UIControl.State.normal)
                                putFrug = 1
                            }
                            
                        }
                    }
                
                    //右上端が白だったら、押下された場所から右上端の白までの黒石をひっくり返す
                    if index! + rightOverDiagonalCount >= 0 && index! - rightOverDiagonalCount <= 63 && !(0...14 ~= index!){
                        if buttonArray[index! - rightOverDiagonalCount].image(for: UIControl.State.normal) == white{
                            for o in stride(from: 7, to: rightOverDiagonalCount, by: 7){
                                buttonArray[index! - o].setImage(white, for: UIControl.State.normal)
                                putFrug = 1
                            }
                            
                        }
                    }
                
                    //左上端が白だったら、押下された場所から左上端の白までの黒石をひっくり返す
                    if index! + leftOverDiagonalCount >= 0 && index! - leftOverDiagonalCount <= 63 && !(0...14 ~= index!){
                        if buttonArray[index! - leftOverDiagonalCount].image(for: UIControl.State.normal) == white{
                            for p in stride(from: 9, to: leftOverDiagonalCount, by: 9){
                                buttonArray[index! - p].setImage(white, for: UIControl.State.normal)
                                putFrug = 1
                            }
                            
                        }
                    }
                
                 if putFrug == 1 {
                    //押下された場所に白石を置く
                    sender.setImage(white, for: UIControl.State.normal)
                    putFrug = 0
                    turn = 0
                    label1.text = "黒"
                }
                
            }
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label1.text = "黒"
        label1.layer.borderWidth = 1.0
        startWhite.setImage(white, for: UIControl.State.normal)
        startWhite2.setImage(white, for: UIControl.State.normal)
        startBlack.setImage(black, for: UIControl.State.normal)
        startBlack2.setImage(black, for: UIControl.State.normal)
        
    }


}

