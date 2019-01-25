//
//  DetailZoneViewController.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 25/01/2019.
//Copyright © 2019 Matthew Usdin. All rights reserved.
//

import UIKit

protocol DetailZoneViewControllerInput: class {
    func viewModelUpdated(_ viewModel: DetailZoneViewModel)
}

final class DetailZoneViewController: UIViewController {

    @IBOutlet weak var refreshButton: UIButton!
    @IBAction func refreshAction(_ sender: UIButton) {
        print("refresh")
    }

    var interactor: DetailZoneInteractorInput?
    var viewModel: DetailZoneViewModel? {
        didSet { updateViewContent() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor = DetailZoneInteractor(presenter: DetailZonePresenter(viewController: self))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func updateViewContent() {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailZoneViewController: DetailZoneViewControllerInput {
    func viewModelUpdated(_ viewModel: DetailZoneViewModel) {
        self.viewModel = viewModel
    }
}
