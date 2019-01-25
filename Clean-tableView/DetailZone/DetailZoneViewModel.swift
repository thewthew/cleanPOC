//
//  DetailZoneViewModel.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 25/01/2019.
//Copyright © 2019 Matthew Usdin. All rights reserved.
//

import Foundation

/// `DetailZoneViewModel` is a struct used by `DetailZoneViewModelViewController` to display content to the user.
internal struct DetailZoneViewModel {
    /// Reference to the internal model.
    private let model: DetailZoneModel
    
    /// Initializes the receiver from the given model.
    ///
    /// - Parameter model: The model to reference.
    init(from model: DetailZoneModel) {
        self.model = model
    }
}
