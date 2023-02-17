//
//  ViewController.swift
//  CustomScrollAndKeyBoard-Test-UIKit
//
//  Created by Oleh Poremskyy on 16.02.2023.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet var textFilelds: [UITextField]!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttobAction(_ sender: Any) {
        textFilelds.publisher
        .sink( receiveValue: { value in
              value.resignFirstResponder()
          })
        
    }
    
}

