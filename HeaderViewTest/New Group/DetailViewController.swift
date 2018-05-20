//
//  DetailViewController.swift
//  HeaderViewTest
//
//  Created by Hajime Kagami on 2018/05/20.
//  Copyright © 2018年 Hajime Kagami. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var NameLabel: UILabel!
    var text:String?

    override func viewWillAppear(_ animated: Bool) {
        guard text != nil else {
            return
        }

        NameLabel.text = text
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
