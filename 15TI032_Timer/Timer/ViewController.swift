//
//  ViewController.swift
//  Timer
//
//  Created by Struuuuggle on 2017/09/07.
//  Copyright © 2017年 Mikiya Abe. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
	@IBOutlet weak var label: UILabel!				// 秒数表示ラベル
	@IBOutlet weak var stopButton: UIButton!		// ストップボタン
	@IBOutlet weak var startButton: UIButton!		// スタートボタン
	@IBOutlet weak var oneMinuteButton: UIButton!	// 1分ボタン
	@IBOutlet weak var OneSecondButton: UIButton!	// 1秒ボタン
	
	/* --- プロパティ --- */
	var timer: Timer?			// タイマーを保持していない時はnilとする
	var currentMinutes: Int = 0		// 現在の分数
	var currentSeconds: Int = 0		// 現在の秒数
	var isCounting: Bool = false	// タイマーがカウントダウンしているかどうかを表すbool型
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	/* --- 秒 -> 分 変換メソッド --- */
	func ifOver60seconds(seconds: Int) {
		if(currentSeconds >= 60) {
			currentMinutes += currentSeconds / 60
			currentSeconds -= 60
		}
	}
	
	/* --- タイマーを開始するメソッド --- */
	func start(seconds: Int) {
		isCounting = true
		timer = Timer.scheduledTimer(timeInterval: 1.0,
		                             target: self,
		                             selector: #selector(ViewController.update),
		                             userInfo: nil,
		                             repeats: true)
	}
	
	/* --- 1分ボタン押下時に呼び出すメソッド --- */
	@IBAction func isOneMinuteButtonTapped(_ sender: UIButton) {
		if isCounting == false {
			currentSeconds += 60
			ifOver60seconds(seconds: currentSeconds)
			print(String(format: "%2d : %2d", currentMinutes, currentSeconds))	// デバッグ用
			label.text = String(format: "%02d : %02d", currentMinutes, currentSeconds)
		}
	}
	
	/* --- 1秒ボタン押下時に呼び出すメソッド --- */
	@IBAction func isOneSecondButtonTapped(_ sender: UIButton) {
		if isCounting == false {
			currentSeconds += 1
			ifOver60seconds(seconds: currentSeconds)
			print("\(currentMinutes) : \(currentSeconds)")
			label.text = String(format: "%02d : %02d", currentMinutes, currentSeconds)
		}
	}
	
	/* --- ストップボタン押下時呼び出すメソッド --- */
	@IBAction func stopButtonTapped(_ sender: UIButton) {
		if isCounting == false {
			stopButton.isEnabled = false
		} else {
			timer?.invalidate()
		}
	}
	
	/* --- スタートボタン押下時呼び出すメソッド --- */
	@IBAction func startButtonTapped(_ sender: UIButton) {
		start(seconds: currentSeconds)
	}
	
	/* --- タイマー完了時に呼び出すメソッド --- */
	func update() {
		print(String(format: "%02d : %02d", currentMinutes, currentSeconds))	// デバッグ用
		
		if (currentSeconds == 0) {
			currentMinutes -= 1
			currentSeconds = 59
		} else {
			currentSeconds -= 1						// 1秒ごとに値を1減らす
		}
		
		label.text = String(format: "%02d : %02d", currentMinutes, currentSeconds)
		if (currentMinutes == 0 && currentSeconds == 0) {
			timer?.invalidate()					//タイマーを停止させる
			let soundId: SystemSoundID = 1010	// 効果音の設定(id: 1005)
			AudioServicesPlayAlertSound(soundId)// 効果音の再生
			isCounting = false
		}
	}
	
}

