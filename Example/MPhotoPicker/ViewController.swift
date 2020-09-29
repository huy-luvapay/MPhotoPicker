//
//  ViewController.swift
//  MPhotoPicker
//
//  Created by huy-luvapay on 09/29/2020.
//  Copyright (c) 2020 huy-luvapay. All rights reserved.
//

import UIKit
import MPhotoPicker

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func showPress() {
        MPhotoPicker.shared.present(in: self, maxSelectCount: 1, isOnlySelectPhoto: true) { (assets) in
            print("\(assets)")
        }
    }

}

