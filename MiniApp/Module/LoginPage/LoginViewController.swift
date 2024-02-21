//
//  LoginViewController.swift
//  MiniApp
//
//  Created by Carlos on 21/02/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var titleEmail: UILabel!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var titlePassword: UILabel!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        titleEmail.text = "Email"
        titlePassword.text = "Password"
    }
    
    @IBAction func btnLoginTapped(_ sender: Any) {
        guard let username = tfEmail.text, let password = tfPassword.text else { return }
        viewModel.loginUser(username: username, password: password) { result in
            switch result {
            case .success(_):
                let homeVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
                self.navigationController?.navigationBar.isHidden = true
                self.navigationController?.pushViewController(homeVC, animated: true)
            case .failure(_):
                print("Login Error!")
            }
        }
    }
    
}
