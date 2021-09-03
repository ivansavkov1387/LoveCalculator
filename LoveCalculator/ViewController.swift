//
//  ViewController.swift
//  LoveCalculator
//
//  Created by Иван on 9/3/21.
//

import UIKit

class ViewController: UIViewController {
    
    let networkManager = NetworkManager()
    var firstName = ""
    var secondName = ""
    lazy var url = "https://love-calculator.p.rapidapi.com/getPercentage?fname=\(firstName)&sname=\(secondName)"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.makeURLrequest(with: url) { (percentage) in
            print(percentage)
        }
        
    }


}

