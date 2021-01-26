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
    
    var lastTweetResponse: GetLastTweetResponse!
    var profilePictureResponse: ProfilePictureResponse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}


extension UserProfileViewController: UserProfileView {
    
    func setViews() {
        lastTweetLabel.text = lastTweetResponse.tweet.isEmpty ? "N/A" : "\"\(lastTweetResponse.tweet)\""
        let url = URL(string: profilePictureResponse.pictureURL)
        profileImageView.load(url: url!)
    }
}
