//
//  ViewController.swift
//  Calculator
//
//  Created by Mikiya Abe. on 2017/09/06.
//  Copyright © 2017年 Mikiya Abe. All rights reserved.
//

import UIKit

/* --- 演算の種類を表す列挙型 --- */
enum Operator {
	case undefined		// 未定義
	case addition		// 加法
	case subtraction	// 減法
	case multiplication	// 乗法
	case division		// 除法
}

class ViewController: UIViewController {
	@IBOutlet weak var label: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	/* --- プロパティ --- */
	var firstValue = 0						// 一つ目の値
	var secondValue = 0						// 二つ目の値
	var currentOperator = Operator.undefined		// 演算の種類
	

	/* --- 数値の入力 --- */
	@IBAction func numberButtonTapped(_ sender: UIButton) {	// 数字ボタンをタップした時(数字を特定する)
		var value: Int? = 0							// 特定した数字に対応する数値を保持する変数
		switch sender.currentTitle! {						// 数字を特定する処理
		case "0":
			value = 0
		case "1":
			value = 1
		case "2":
			value = 2
		case "3":
			value = 3
		case "4":
			value = 4
		case "5":
			value = 5
		case "6":
			value = 6
		case "7":
			value = 7
		case "8":
			value = 8
		case "9":
			value = 9
		default:
			value = nil
		}
		
		if currentOperator == .undefined {
			if value == nil {	// "%"のとき
				firstValue = firstValue / 100
				label.text = "\(firstValue)"
			}
			else {
				firstValue = firstValue * 10 + value!
				label.text = "\(firstValue)"
			}
		}
		else {
			if value == nil {	// "%"のとき
				secondValue = secondValue / 100
				label.text = "\(secondValue)"
			}
			else {
				secondValue = secondValue * 10 + value!
				label.text = "\(secondValue)"
			}
		}
	}
	
	/* --- 演算の種類の入力 --- */
	@IBAction func operatorButtonTapped(_ sender: UIButton) {	// 演算子ボタンをタップした時
		switch sender.currentTitle! {							// 演算の種類を記憶する処理
		case "+":
			currentOperator = .addition
		case "-":
			currentOperator = .subtraction
		case "×":
			currentOperator = .multiplication
		case "÷":
			currentOperator = .division
		default:
			currentOperator = .undefined
		}
	}
	
	/* --- 結果の表示 --- */
	@IBAction func equalButtonTapped(_ sender: UIButton) {	// "="ボタンをタップした時
		var value = 0										// 演算の処理を保持する変数
		switch currentOperator {							// 演算を行う(結果をvalueに保持する)
		case .addition:
			value = firstValue + secondValue
		case .subtraction:
			value = firstValue - secondValue
		case .multiplication:
			value = firstValue * secondValue
		case .division:
			value = firstValue / secondValue
		case .undefined:
			value = firstValue
		}
		label.text = "\(value)"								// ラベルに反映させる
		firstValue = 0
		secondValue = 0
		currentOperator = .undefined
	}
	
	/* --- オールクリア --- */
	@IBAction func allClearButtonTapped(_ sender: UIButton) {	// "AC"ボタンをタップした時
		firstValue = 0
		secondValue = 0
		currentOperator = .undefined
		label.text = "0"
	}
	
	/* --- クリア --- */
	@IBAction func clearButtonTapped(_ sender: UIButton) {
		secondValue = 0
		label.text = "0"
	}
	
}

