//
//  ViewController.swift
//  Calculatar
//
//  Created by Yuki Hirayama on 2023/04/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    //整数バージョン
    var number: Int = 0 //代入する数 教科書のnumber1
    var tmp: Int = 0 //数を一時保管 教科書のnumber2
    var ans: Int = 0 //最終結果 教科書のnumber3
    
    //少数バージョン
    var float_number: Double = 0
    var float_tmp: Double = 0
    var float_ans: Double = 0
    
    var float_location: Int = 0 //少数点以下何桁か
    
    //falseなら整数、trueなら少数の計算
    var isFloatNumber: Bool = false //現在の入力が少数かどうか
    var isFloatCulculate: Bool = false //式が少数の計算を含むか
    
    var ope: Int = 0 //計算の種類を判別
    /*
     opeの値の意味
     0: 計算のはじめ・最初の入力
     1: 足し算
     2: 引き算
     3: かけ算
     4: 割り算
     5: =を押した直後
    */

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func select1() {
        //計算するため整数を代入する
        substituteNumber(substituteNumber: 1)
    }
    
    @IBAction func select2() {
        substituteNumber(substituteNumber: 2)
    }
    
    @IBAction func select3() {
        substituteNumber(substituteNumber: 3)
    }
    
    @IBAction func select4() {
        substituteNumber(substituteNumber: 4)
    }
    
    @IBAction func select5() {
        substituteNumber(substituteNumber: 5)
    }
    
    @IBAction func select6() {
        substituteNumber(substituteNumber: 6)
    }
    
    @IBAction func select7() {
        substituteNumber(substituteNumber: 7)
    }
    
    @IBAction func select8() {
        substituteNumber(substituteNumber: 8)
    }
    
    @IBAction func select9() {
        substituteNumber(substituteNumber: 9)
    }
    
    @IBAction func select0() {
        substituteNumber(substituteNumber: 0)
    }
    
    //+ プラスボタン
    @IBAction func plus() {
        //演算子（+, -, ×, ÷）が押されたときの処理
        operatorFunc()
        ope = 1
    }
    
    //- マイナスボタン
    @IBAction func minus() {
        operatorFunc()
        ope = 2
    }
    
    //× 掛け算ボタン
    @IBAction func times() {
        operatorFunc()
        ope = 3
    }
    
    //÷ 割り算ボタン
    @IBAction func devide() {
        operatorFunc()
        ope = 4
    }
    
    //. 少数ボタン
    @IBAction func isFloat() {
        if isFloatCulculate == false {
            isFloatCulculate = true
            
            //number（現在の入力）には影響なし
            //Int型のが残っていた場合に少数の計算ができるように移行
            float_tmp = Double(tmp)
            float_ans = Double(ans)
        }
        isFloatNumber = true //現在の入力が少数と示す
        
        //少数の計算のため移行
        //このボタンが押されるまではnumberに入力値はいれられている
        float_number = Double(number)
    }
    
    //C クリアボタン
    @IBAction func clear() {
        //全部の値初期化
        number = 0
        tmp = 0
        ans = 0
        float_number = 0
        float_tmp = 0
        float_ans = 0
        float_location = 0
        ope = 0
        isFloatCulculate = false
        isFloatNumber = false
        label.text = "0"
    }
    
    //= イコールボタン
    @IBAction func equal() {
        if isFloatCulculate == false { //整数の計算
            ans = calculate(firstNum: tmp, secondNum: number)
            tmp = ans //=押した後も計算できるように計算結果を移行
            label.text = String(ans)
        } else { //少数の計算
            if isFloatNumber == false { //少数の計算中なのに入力が整数のとき
                float_number = Double(number) //型をそろえないと計算できないためdouble型にする
            }
            float_ans = calculateFloat(firstNum: float_tmp, secondNum: float_number)
            print(float_number, float_tmp, float_ans)
            float_tmp = float_ans
            label.text = String(float_ans)
        }
        
        float_location = 0
        ope = 5
//        print(number)
//        print(tmp)
//        print(ans)
    }
    
    //int型の計算する関数
    func calculate(firstNum num1: Int, secondNum num2: Int) -> Int {
        var result: Int = 0 //計算結果
        
        if ope == 1 { //足し算
            result = num1 + num2
        } else if ope == 2 { //引き算
            result = num1 - num2
        } else if ope == 3 { //掛け算
            result = num1 * num2
        } else if ope == 4 { //割り算
            result = num1 / num2
        }
        
//        print(num1, num2)
        
        return result
    }
    
    //少数の計算する関数
    func calculateFloat(firstNum num1: Double, secondNum num2: Double) -> Double {
        var result: Double = 0
        
        if ope == 1 {
            result = num1 + num2
        } else if ope == 2 {
            result = num1 - num2
        } else if ope == 3 {
            result = num1 * num2
        } else if ope == 4 {
            result = num1 / num2
        }
        
//        print(num1, num2)
        
        return result
    }
    
    //演算子それぞれが押されたの処理 plus, minus, times, devide
    func operatorFunc() {
        if isFloatCulculate == false { //整数の計算
            if ope == 0 { //計算のはじめ
                tmp = number //numberには次の入力がくるからtmpに前の入力を移行させておく
            } else if ope == 5 { //=が押された直後
                tmp = ans //計算する時はtmpを使っているため前の計算結果をまた使えるように移行
            } else { //他の演算子 +, -, ×, ÷
                tmp = calculate(firstNum: tmp, secondNum: number) //前から順番に計算する
            }
            number = 0 //入力値の初期化
        } else { //少数の計算
            if ope == 0 {
                float_tmp = float_number
            } else if ope == 5 {
                float_tmp = float_ans
            } else {
                float_tmp = calculateFloat(firstNum: float_tmp, secondNum: float_number)
            }
            
            //次の入力値のため変数の初期化
            float_number = 0.0
            number = 0
            float_location = 0
            isFloatNumber = false
        }
    }
    
    //数値の代入
    func substituteNumber(substituteNumber num: Int) {
        if isFloatNumber == false { //整数の入力
            number = number * 10 + num
            label.text = String(number)
        } else { //少数の入力
            float_location += 1 //少数点以下何桁目か
            
            //入力が小数点以下何桁目か調べて今までの値にプラスすることで少数の値をつくってる
            //pow(Double, Double)のためfloat_locationはDoubleでキャスト
            float_number = float_number + Double(num) / pow(10, Double(float_location))
            
            //仕様上誤差がでるため無理やり表示できる範囲を指定
            //詳しくはswift浮動小数点誤差とかで検索
            label.text = String(format: "%.\(float_location)f", float_number)
        }
    }
}


