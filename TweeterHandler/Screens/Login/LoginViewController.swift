//
//  LoginViewController.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 23/01/2021.
//

import UIKit
//statuses/user_timeline


class LoginViewController: UIViewController {
    
    private lazy var presenter = {
        return LoginPresenter(view: self)
    }()
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var usernameInputTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        presenter.login(with: usernameInputTextField.text)
    }
    
}

extension LoginViewController: LoginView {
    
    func navigateToUserDetails(usingDataTransport data: LoginResponse) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "UserProfile", bundle: nil)
        guard let viewController = storyBoard.instantiateInitialViewController() as? UserProfileViewController else {
            return
        }
        viewController.loginResponse = data
        self.show(viewController, sender: self)
    }
    
    func displayError(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func setViews() {
        loginButton.layer.cornerRadius = 10
        loginButton.backgroundColor = .blue
        loginButton.setTitleColor(.white, for: .normal)
    }
    
}
