//
//  ViewController.swift
//  HelloFirebase
//
//  Created by AdBox on 7/16/17.
//  Copyright © 2017 myth. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController {

    @IBOutlet weak var lb_condition: UILabel!
    
    // create the reference of database with a path
    let rootRef = Database.database().reference().child("condition")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        rootRef.observe(.value) { (dsnap : DataSnapshot) in
            self.lb_condition.text = dsnap.value as? String
            self.changeBackgroundColor(text: (dsnap.value as? String)!)
        }
    }
    
    func changeBackgroundColor(text: String) {
        
        if text == "sunny" {
            view.backgroundColor = UIColor.white
        }
        else {
            view.backgroundColor = UIColor.lightGray
        }
    }

    @IBAction func sunny(_ sender: Any) {
        rootRef.setValue("sunny")
        changeBackgroundColor(text: "sunny")
    }

    @IBAction func foggy(_ sender: Any) {
        rootRef.setValue("foggy")
        changeBackgroundColor(text: "foggy")
    }
}

