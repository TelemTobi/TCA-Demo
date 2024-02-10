//
//  LoginViewController.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 10/02/2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Login"
        setup()
    }
    
    private func setup() {
        let loginButton = UIButton(
            configuration: .borderedProminent(),
            primaryAction: UIAction(
                title: "Log In",
                handler: { _ in
                    print("Log In")
                }
            )
        )
        
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
