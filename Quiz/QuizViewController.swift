//
//  QuizViewController.swift
//  Quiz
//
//  Created by litech on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //クイズを格納する配列
    var quizArray = [[Any]]()
    
    //正解数
    var correctAnswer: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------------------ここから下にクイズを書く------------------------//
        quizArray.append(["Life is Tech!のロゴTシャツにない色は？", "赤", "オレンジ", "黄色", 2])
        quizArray.append(["5月4日は何の日？", "みどりの日", "昭和の日", "憲法記念日", 1])
        quizArray.append(["信号にない色は？", "赤", "黄", "紫", 3])
        
        quizArray.append(["「寝耳に水」の水は何の水？", "海水", "井戸の水", "洪水", 3])
        
        quizArray.append(["信号にない色は？", "赤", "黄", "紫", 3])
        
        quizArray.append(["音楽一番盛り上がるところの「サビ」の語源は？", "さびついた石", "わびさび", "わさび", 3])
        
        quizArray.append(["パンダの尻尾の色は？", "白", "黒", "個体による", 1])
        
        quizArray.append(["信号にない色は？", "赤", "黄", "紫", 3])
        
        
        
        
        
        //------------------------ここから上にクイズを書く------------------------//
        quizArray.shuffle()
        choiceQuiz()
    }
    
    func choiceQuiz() {
        quizTextView.text = quizArray[0][0] as? String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choiceButtons1.setTitle(quizArray[0][1] as? String, for: .normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, for: .normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, for: .normal)
    }
    
    @IBOutlet var trueorfalseimage : UIImageView!

    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            //正解数を増やす
            
            trueorfalseimage.image = UIImage(named: "true.png")
            
            correctAnswer+=1
        } else {
            trueorfalseimage.image = UIImage(named: "false.png")
        }
        
        quizArray.remove(at: 0)
        
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destination as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
}


