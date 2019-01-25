//
//  WelcomeViewModel.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 25/01/2019.
//Copyright © 2019 Matthew Usdin. All rights reserved.
//

import Foundation

/// `WelcomeViewModel` is a struct used by `WelcomeViewModelViewController` to display content to the user.
internal struct WelcomeViewModel {
    /// Reference to the internal model.
    private let model: WelcomeModel

    var count : String? {
        return "Vous avez ouvert \(model.countNumber!) fois l'app !"
    }
    /// Initializes the receiver from the given model.
    ///
    /// - Parameter model: The model to reference.
    init(from model: WelcomeModel) {
        self.model = model
    }
}
