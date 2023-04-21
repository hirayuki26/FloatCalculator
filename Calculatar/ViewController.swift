//
//  ViewController.swift
//  Calculatar
//
//  Created by Yuki Hirayama on 2023/04/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var number: Int = 0 //代入する数
    var tmp: Int = 0 //数を一時保管
    var ans: Int = 0 //最終結果
    
    var float_number: Double = 0
    var float_tmp: Double = 0
    var float_ans: Double = 0
    
    var float_location: Int = 0 //少数点以下何桁か計算
    
    var isFloatNumber: Bool = false
    var isFloatCulculate: Bool = false
    
    var ope: Int = 0 //計算の種類を判別

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func select1() {
        //数値代入
        if isFloatNumber == false {
            substituteIntNumber(substituteNumber: 1)
        } else {
            substituteFloatNumber(substituteNumber: 1)
        }
    }
    
    @IBAction func select2() {
        if isFloatNumber == false {
            substituteIntNumber(substituteNumber: 2)
        } else {
            substituteFloatNumber(substituteNumber: 2)
        }
    }
    
    @IBAction func select3() {
        if isFloatNumber == false {
            substituteIntNumber(substituteNumber: 3)
        } else {
            substituteFloatNumber(substituteNumber: 3)
        }
    }
    
    @IBAction func select4() {
        if isFloatNumber == false {
            substituteIntNumber(substituteNumber: 4)
        } else {
            substituteFloatNumber(substituteNumber: 4)
        }
    }
    
    @IBAction func select5() {
        if isFloatNumber == false {
            substituteIntNumber(substituteNumber: 5)
        } else {
            substituteFloatNumber(substituteNumber: 5)
        }
    }
    
    @IBAction func select6() {
        if isFloatNumber == false {
            substituteIntNumber(substituteNumber: 6)
        } else {
            substituteFloatNumber(substituteNumber: 6)
        }
    }
    
    @IBAction func select7() {
        if isFloatNumber == false {
            substituteIntNumber(substituteNumber: 7)
        } else {
            substituteFloatNumber(substituteNumber: 7)
        }
    }
    
    @IBAction func select8() {
        if isFloatNumber == false {
            substituteIntNumber(substituteNumber: 8)
        } else {
            substituteFloatNumber(substituteNumber: 8)
        }
    }
    
    @IBAction func select9() {
        if isFloatNumber == false {
            substituteIntNumber(substituteNumber: 9)
        } else {
            substituteFloatNumber(substituteNumber: 9)
        }
    }
    
    @IBAction func select0() {
        if isFloatNumber == false {
            substituteIntNumber(substituteNumber: 0)
        } else {
            substituteFloatNumber(substituteNumber: 0)
        }
    }
    
    @IBAction func plus() {
        operatorFunc()
        ope = 1
    }
    
    @IBAction func minus() {
        operatorFunc()
        ope = 2
    }
    
    @IBAction func times() {
        operatorFunc()
        ope = 3
    }
    
    @IBAction func devide() {
        operatorFunc()
        ope = 4
    }
    
    @IBAction func calculateFloat() {
        isFloatNumber = true
        isFloatCulculate = true
    }
    
    @IBAction func clear() {
        number = 0
        tmp = 0
        ans = 0
        ope = 0
        isFloatCulculate = false
        label.text = "0"
    }
    
    @IBAction func equal() {
        ans = calculate(firstNum: tmp, secondNum: number)
        tmp = ans
        label.text = String(ans)
        ope = 5
//        print(number)
//        print(tmp)
//        print(ans)
    }
    
    //int型の計算する関数
    func calculate(firstNum num1: Int, secondNum num2: Int) -> Int {
        var result: Int = 0
        
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
    
    //演算子それぞれの処理 plus, minus, times, devide
    func operatorFunc() {
        if ope == 0 {
            tmp = number
        } else if ope == 5 {
            tmp = ans
        } else {
            tmp = calculate(firstNum: tmp, secondNum: number)
        }
        number = 0
    }
    
    //整数の代入
    func substituteIntNumber(substituteNumber num: Int) {
        number = number * 10 + num
        label.text = String(number)
    }

    //少数の代入
    func substituteFloatNumber(substituteNumber num: Double) {
        //少数点以下何桁目かを数える変数
        float_location += 1
        
        //pow(Double, Double)のためfloat_locationはDoubleでキャスト
        float_number = float_number + num / pow(10, Double(float_location))
        label.text = String(float_number)
    }
}


