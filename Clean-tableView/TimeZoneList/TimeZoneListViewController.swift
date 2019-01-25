//
//  TimeZoneListViewController.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 25/01/2019.
//Copyright © 2019 Matthew Usdin. All rights reserved.
//

import UIKit

protocol TimeZoneListViewControllerInput: class {
    func viewModelUpdated(_ viewModel: TimeZoneListViewModel)
}

final class TimeZoneListViewController: UIViewController {


    @IBOutlet weak var timeZoneTableView: UITableView!
    var interactor: TimeZoneListInteractorInput?
    var viewModel: TimeZoneListViewModel? {
        didSet { updateViewContent() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timeZoneTableView.delegate = self
        timeZoneTableView.dataSource = self
        interactor = TimeZoneListInteractor(presenter: TimeZoneListPresenter(viewController: self))
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

    func fetchData(){

    }

}

extension TimeZoneListViewController: TimeZoneListViewControllerInput {
    func viewModelUpdated(_ viewModel: TimeZoneListViewModel) {
        self.viewModel = viewModel
    }
}

extension TimeZoneListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = "time zone"

        return cell
    }


}
