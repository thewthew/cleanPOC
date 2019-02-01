//
//  NewTemplateDetailZoneViewController.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 01/02/2019.
//  Copyright © 2019 Matthew Usdin. All rights reserved.
//

import UIKit

protocol NewTemplateDetailZoneViewControllerInput: class {
    func viewModelUpdated(_ viewModel: NewTemplateDetailZoneViewModel)
}

final class NewTemplateDetailZoneViewController: UIViewController
{

    @IBOutlet weak var timeDetailLabel: UILabel!
    @IBOutlet weak var zoneNameLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBAction func refreshAction(_ sender: UIButton) {
        print("refresh new temp")
    }

    var zoneName : String?
    var interactor: NewTemplateDetailZoneInteractorInput?
    var viewModel: NewTemplateDetailZoneViewModel? {
        didSet { updateViewContent() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor = NewTemplateDetailZoneInteractor(presenter: NewTemplateDetailZonePresenter(viewController: self))
        if let zoneName = zoneName {
            interactor?.loadContent(zonename: zoneName)
        }
    }
    
    private func updateViewContent() {
        DispatchQueue.main.async() { [weak self] in
            self?.zoneNameLabel.text = self?.viewModel?.zoneString
            self?.timeDetailLabel.text = self?.viewModel?.date
        }
    }

}

extension NewTemplateDetailZoneViewController: NewTemplateDetailZoneViewControllerInput {
    func viewModelUpdated(_ viewModel: NewTemplateDetailZoneViewModel) {
        self.viewModel = viewModel
    }
}
