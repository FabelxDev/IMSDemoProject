//
//  UserProfileViewController.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 25/01/2021.
//

import UIKit


class UserProfileViewController: UIViewController {
    
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var lastTweetLabel: UILabel!
    
    private lazy var presenter = {
        return UserProfilePresenter(view: self)
    }()
    
    var loginResponse: LoginResponse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}


extension UserProfileViewController: UserProfileView {
    
    func setViews() {
        lastTweetLabel.text = loginResponse.tweet.isEmpty ? "" : loginResponse.tweet
        let url = URL(string: loginResponse.profile)
        profileImageView.load(url: url!)
    }
}
