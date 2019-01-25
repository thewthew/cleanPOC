//
//  WelcomeViewController.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 25/01/2019.
//Copyright © 2019 Matthew Usdin. All rights reserved.
//

import UIKit

protocol WelcomeViewControllerInput: class {
    func viewModelUpdated(_ viewModel: WelcomeViewModel)
}

final class WelcomeViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nbConnexionLabel: UILabel!
    var interactor: WelcomeInteractorInput?
    var viewModel: WelcomeViewModel? {
        didSet { updateViewContent() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        interactor = WelcomeInteractor(presenter: WelcomePresenter(viewController: self))
        interactor?.loadContent()
    }
    
    private func updateViewContent() {
        nbConnexionLabel.text = viewModel?.count
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a lit   tle preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WelcomeViewController: WelcomeViewControllerInput {
    func viewModelUpdated(_ viewModel: WelcomeViewModel) {
        self.viewModel = viewModel
    }
}
