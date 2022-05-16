//
//  SecondViewController.swift
//  Right on target
//
//  Created by Данил Менделев on 16.05.2022.
//

import UIKit

class SecondViewController: UIViewController {    
    @IBAction func hideCurrentScene() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
