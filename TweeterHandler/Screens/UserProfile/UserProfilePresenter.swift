//
//  UserProfilePresenter.swift
//  TweeterHandler
//
//  Created by Joseph Tamas on 26/01/2021.
//

import Foundation


class UserProfilePresenter {
    
    private weak var view: UserProfileView?
    
    init(view: UserProfileView) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.setViews()
    }
    
}
