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
    
    var dataSource = [DataModel(name: "Waseem Wani", prTitle: "Code refactoring and removed extra blank lines", prCreatedDate: "22-Aug-2022", prClosedDate: "23-Aug-2022")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Your Closed Pull Requests"
        let nib = UINib(nibName: "PRInfoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PRInfoTableViewCell")
        tableView.estimatedRowHeight = 235
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension PRListViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 135
//    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return
//    }
}

extension PRListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PRInfoTableViewCell", for: indexPath) as? PRInfoTableViewCell else { return UITableViewCell() }
        cell.configure(with: dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath)
        print(currentCell)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

