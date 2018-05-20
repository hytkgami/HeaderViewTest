//
//  ViewController.swift
//  HeaderViewTest
//
//  Created by Hajime Kagami on 2018/05/15.
//  Copyright © 2018年 Hajime Kagami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let rows = ["apple", "banana", "charlie", "duff", "Echo","fredy", "George", "Hope", "Idle", "Jack", "King", "Light", "Matt", "Noel"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UINib(nibName: "FeedCell", bundle: nil), forCellReuseIdentifier: "FeedCell")

//        let nib = UINib(nibName: "HeaderViewCell", bundle: nil)
//        guard let headerView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
//            return
//        }
        let nib = UINib(nibName: "HeaderView", bundle: nil)
        guard let headerView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        tableView.tableHeaderView = headerView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? UITableViewCell else {
            fatalError("セグエ移動する前にセルを取得できませんでした。")
        }
        guard let indexPath = tableView.indexPath(for: cell) else {
            fatalError("indexPathが取得できませんでした")
        }
        if segue.identifier == "toDetailViewController" {
            // code
            let detailVC = segue.destination as? DetailViewController
            detailVC?.text = rows[indexPath.row]
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 78
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailViewController", sender: tableView.cellForRow(at: indexPath))
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as? FeedCell else {
            return UITableViewCell()
        }
        cell.contentLabel.text = rows[indexPath.row]
        return cell
    }
}
