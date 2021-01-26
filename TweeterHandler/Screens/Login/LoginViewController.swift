//
//  LoginViewController.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 23/01/2021.
//

import UIKit



class LoginViewController: UIViewController {
    
    private lazy var presenter = {
        return LoginPresenter(view: self)
    }()
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        presenter.login()
    }
}

extension LoginViewController: LoginView {
    
    func displayError(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func navigateToProfile() {
        print("navigating...")
    }
    
    func setViews() {
        print("setting views...")
    }
    
}
