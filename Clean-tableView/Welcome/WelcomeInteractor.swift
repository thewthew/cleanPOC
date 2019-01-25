//
//  WelcomeInteractor.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 25/01/2019.
//Copyright © 2019 Matthew Usdin. All rights reserved.
//

import Foundation

protocol WelcomeInteractorInput: class {
    func loadContent()
}

final class WelcomeInteractor {
    var presenter: WelcomePresenterInput? {
        didSet { presenter?.modelUpdated(model) }
    }

    var model: WelcomeModel!

    init(presenter: WelcomePresenterInput?) {
        self.presenter = presenter
    }
    
}

extension WelcomeInteractor: WelcomeInteractorInput {
    func loadContent() {
        let currentCount = UserDefaults.standard.integer(forKey: "launchCount")
        UserDefaults.standard.set(currentCount+1, forKey:"launchCount")
    }
}
