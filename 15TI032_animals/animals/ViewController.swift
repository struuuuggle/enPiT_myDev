//
//  ViewController.swift
//  animals
//
//  Created by Mikiya Abe on 2017/09/06.
//  Copyright © 2017年 Mikiya Abe. All rights reserved.
//

import UIKit

/* --- 動物のデータの配列 ---*/
struct AnimalInfo {
	var name: String
	var description: String	
}

class ViewController: UIViewController, UITableViewDataSource {
	@IBOutlet weak var tableView: UITableView!
	
	let items = [
		AnimalInfo(name: "ライオン", description: "百獣の王。一般的に最も強い動物として知られている。"),
		AnimalInfo(name: "サイ", description: "頭部に硬いツノを持っている。巨体に似合わず最高時速50kmで走る。"),
		AnimalInfo(name: "シマウマ", description: "白黒の縞模様を持つ動物。視覚や嗅覚、聴覚が優れている。"),
		AnimalInfo(name: "キリン", description: "最も背が高い動物。首が長いところが特徴。"),
		AnimalInfo(name: "ゾウ", description: "陸生動物では世界最大の動物。鼻は立っていても地面に届くほどに長い。"),
	]

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		tableView.dataSource = self
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	/* --- 値の受け渡しを行う ---*/
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let selectedRow = tableView.indexPathForSelectedRow {
			let controller = segue.destination as! Detail_ViewController
			controller.info = items[selectedRow.row]
		}
	}
	
	/* --- アイテムの要素の個数だけセルを生成 --- */
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}
	
	/* --- 引数で渡した文字列にマッチする名前のUITableViewCellのインスタンスを返す --- */
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "NameCell")
		let item = items[indexPath.row]
		cell.textLabel?.text = item.name
		return cell
	}
}

