//
//  ViewController.swift
//  GitFinder
//
//  Created by Waseem Wani on 24/08/22.
//

import UIKit
struct DataModel {
    let name: String?
    let prTitle: String?
    let prCreatedDate: String?
    let prClosedDate: String?
}

class PRListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var dataSource = [
        DataModel(name: "Waseem Wani", prTitle: "Code refactoring and removed extra blank lines", prCreatedDate: "22-Aug-2022", prClosedDate: "23-Aug-2022")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Your Closed Pull Requests"
        tableView.register(PRInfoTableViewCell.nib, forCellReuseIdentifier: PRInfoTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension PRListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        PRInfoTableViewCell.estimatedHeight
    }
}

extension PRListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PRInfoTableViewCell.identifier, for: indexPath) as? PRInfoTableViewCell else { return UITableViewCell() }
        cell.configure(with: dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

