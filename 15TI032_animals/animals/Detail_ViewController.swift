//
//  Detail ViewController.swift
//  animals
//
//  Created by Struuuuggle on 2017/09/06.
//  Copyright © 2017年 Mikiya Abe. All rights reserved.
//

import UIKit

class Detail_ViewController: UIViewController {
	@IBOutlet weak var label: UILabel!
	var info: AnimalInfo!

	@IBOutlet weak var animalImageView: UIImageView!	// 追加
	
		override func viewDidLoad() {
		super.viewDidLoad()

			
		// 追加ここから
		let fileName = info.name + ".jpg"		// 表示する画像のファイル名を取得する
		print("\(fileName)")					// デバッグ用
		
		let image = UIImage(named: fileName)	// 取得したファイル名の画像を開く
		animalImageView.image = image
		// 追加ここまで
		
		// Do any additional setup after loading the view.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
