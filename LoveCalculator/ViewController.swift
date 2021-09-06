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
    var url: String {
        get {
            "https://love-calculator.p.rapidapi.com/getPercentage?fname=\(firstName)&sname=\(secondName)"
        }
    }
    
    let mainLabel = UILabel()
    let secondaryLabel = UILabel()
    let firstTFLabel = UILabel()
    let secondTFLabel = UILabel()
    let firstTextField = UITextField()
    let secondTextField = UITextField()
    let checkButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMainLabel()
        configureSecondaryLabel()
        configureFirstTFLabel()
        configureSecondTFLabel()
        configureFirstTextField()
        configureSecondTextField()
        configureCheckButton()
        
        layout()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setTFBorders(for: firstTextField)
        setTFBorders(for: secondTextField)
    }
    
    func configureMainLabel() {
        mainLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        mainLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 30)
        mainLabel.textColor = .red
        mainLabel.textAlignment = .left
        mainLabel.text = "Love calculator"
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainLabel)
        
    }
    
    func configureSecondaryLabel() {
        secondaryLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        secondaryLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 15)
        secondaryLabel.textColor = .gray
        secondaryLabel.textAlignment = .left
        secondaryLabel.text = "It's fun"
        secondaryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(secondaryLabel)
    }
    
    func configureFirstTFLabel() {
        firstTFLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        firstTFLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        firstTFLabel.textColor = .systemGray
        firstTFLabel.textAlignment = .left
        firstTFLabel.text = "FIRST NAME"
        firstTFLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(firstTFLabel)
    }
    
    func configureSecondTFLabel() {
        secondTFLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        secondTFLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        secondTFLabel.textColor = .systemGray
        secondTFLabel.textAlignment = .left
        secondTFLabel.text = "SECOND NAME"
        secondTFLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(secondTFLabel)
        
    }
    
    func configureFirstTextField() {
        firstTextField.frame = CGRect(x: 0, y: 0, width: 300, height: 0)
        firstTextField.placeholder = "Enter first name"
        firstTextField.tag = 0
        firstTextField.delegate = self
        firstTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(firstTextField)
    }
    
    func configureSecondTextField() {
        secondTextField.frame = CGRect(x: 0, y: 0, width: 300, height: 0)
        secondTextField.placeholder = "Enter second name"
        secondTextField.tag = 1
        secondTextField.delegate = self
        secondTextField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(secondTextField)
    }
    
    func configureCheckButton() {
        checkButton.frame = CGRect(x: 0, y: 0, width: 250, height: 50)
        checkButton.backgroundColor = .red
        checkButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 15)
        checkButton.setTitle("Check it!", for: .normal)
        checkButton.layer.cornerRadius = 10
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        
        checkButton.addTarget(self, action: #selector(checkButtonPressed), for: .touchUpInside)
        
        view.addSubview(checkButton)
    }
    
    func setTFBorders(for textField: UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textField.frame.height - 1, width: textField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.systemGray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
    }
    
    func layout() {
        
        mainLabel.topAnchor.constraint(lessThanOrEqualTo: view.topAnchor, constant: 100).isActive = true
        mainLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        mainLabel.bottomAnchor.constraint(equalTo: secondaryLabel.topAnchor, constant: -12).isActive = true
        mainLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mainLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        secondaryLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        secondaryLabel.bottomAnchor.constraint(greaterThanOrEqualTo: firstTFLabel.topAnchor, constant: -50).isActive = true
        secondaryLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        secondaryLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        firstTFLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        firstTFLabel.bottomAnchor.constraint(equalTo: firstTextField.topAnchor, constant: -6).isActive = true
        firstTFLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        firstTFLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        secondTFLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        secondTFLabel.bottomAnchor.constraint(equalTo: secondTextField.topAnchor, constant: -6).isActive = true
        secondTFLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        secondTFLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        firstTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        firstTextField.bottomAnchor.constraint(greaterThanOrEqualTo: secondTFLabel.topAnchor, constant: -12).isActive = true
        firstTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        firstTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        secondTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        secondTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        secondTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        checkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        checkButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        checkButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
    }
    
    @objc func checkButtonPressed() {
        firstName = firstTextField.text ?? ""
        secondName = secondTextField.text ?? ""
        
        networkManager.makeURLrequest(with: url) { (result) in
            DispatchQueue.main.async {
                let destination = self.storyboard?.instantiateViewController(identifier: "ResultsViewController") as! ResultsViewController
                destination.label.text = result.percentage
                destination.resultLabel.text = result.result
                destination.modalPresentationStyle = .fullScreen
                destination.modalTransitionStyle = .coverVertical
                self.present(destination, animated: true, completion: nil)
            }
        }
        
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0: secondTextField.becomeFirstResponder()
        case 1: checkButtonPressed()
        default: textField.resignFirstResponder()
        }
        return true
    }
    
}

extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

