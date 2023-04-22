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
    
    @IBAction func isFloat() {
        if isFloatCulculate == false {
            isFloatCulculate = true
            
            //number（現在の入力）には影響なし
            float_tmp = Double(tmp)
            float_ans = Double(ans)
        }
        isFloatNumber = true
        
        float_number = Double(number)
    }
    
    @IBAction func clear() {
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
    
    @IBAction func equal() {
        if isFloatCulculate == false {
            ans = calculate(firstNum: tmp, secondNum: number)
            tmp = ans
            label.text = String(ans)
        } else {
            if isFloatNumber == false {
                float_number = Double(number)
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
    
    //演算子それぞれの処理 plus, minus, times, devide
    func operatorFunc() {
        if isFloatCulculate == false {
            if ope == 0 {
                tmp = number
            } else if ope == 5 {
                tmp = ans
            } else {
                tmp = calculate(firstNum: tmp, secondNum: number)
            }
            number = 0
        } else {
            if ope == 0 {
                float_tmp = float_number
            } else if ope == 5 {
                float_tmp = float_ans
            } else {
                float_tmp = calculateFloat(firstNum: float_tmp, secondNum: float_number)
            }
            float_number = 0.0
            number = 0
            float_location = 0
            isFloatNumber = false
        }
    }
    
    //数値の代入
    func substituteNumber(substituteNumber num: Int) {
        if isFloatNumber == false {
            number = number * 10 + num
            label.text = String(number)
        } else {
            float_location += 1
            
            //pow(Double, Double)のためfloat_locationはDoubleでキャスト
            float_number = float_number + Double(num) / pow(10, Double(float_location))
            label.text = String(format: "%.\(float_location)f", float_number)
        }
    }
}


