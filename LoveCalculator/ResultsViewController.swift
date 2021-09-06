//
//  ResultsViewController.swift
//  LoveCalculator
//
//  Created by Иван on 9/5/21.
//

import UIKit

class ResultsViewController: UIViewController {
    
    let imageView = UIImageView()
    let label = UILabel()
    let resultLabel = UILabel()
    let retryButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureLabel()
        configureImageView()
        configureResultLabel()
        configureRetryButton()
        layout()
        
    }
    
    func configureImageView() {
        imageView.frame = CGRect.zero
        imageView.image = UIImage(named: "heart")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.addSubview(label)
        view.addSubview(imageView)
        
    }
    
    func configureLabel() {
        label.frame = CGRect.zero
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 40)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func configureResultLabel() {
        resultLabel.frame = CGRect.zero
        resultLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        resultLabel.textColor = .black
        resultLabel.textAlignment = .center
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultLabel)
        
    }
    
    func configureRetryButton() {
        retryButton.frame = CGRect.zero
        retryButton.backgroundColor = .red
        retryButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 15)
        retryButton.setTitle("Retry", for: .normal)
        retryButton.layer.cornerRadius = 10
        retryButton.translatesAutoresizingMaskIntoConstraints = false
        
        retryButton.addTarget(self, action: #selector(retryButtonPressed), for: .touchUpInside)
        
        view.addSubview(retryButton)
        
    }
    
    func layout() {
        imageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        
        resultLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        resultLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        resultLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50).isActive = true
        resultLabel.bottomAnchor.constraint(lessThanOrEqualTo: retryButton.topAnchor, constant: -24).isActive = true
        
        
        retryButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        retryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        retryButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        retryButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    @objc func retryButtonPressed() {
        dismiss(animated: true)
    }
    
    

}
