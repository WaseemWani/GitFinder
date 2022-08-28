//
//  ViewController.swift
//  GitFinder
//
//  Created by Waseem Wani on 24/08/22.
//

import UIKit

class PRListViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Variables
    var viewModel: PRListViewModel?
    let errorMsg = " Failed to fetch data"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = PRListViewModel()
        self.title = "Closed Pull Requests"
        setupTableView()
        populateTableView()
    }
    
    private func startStopActivityIndicator(isAnimating: Bool) {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        tableView.backgroundView = activityIndicator
        activityIndicator.color = .gray
        isAnimating ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
    
    private func setupTableView() {
        tableView.register(PRInfoTableViewCell.nib, forCellReuseIdentifier: PRInfoTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func populateTableView() {
        startStopActivityIndicator(isAnimating: true)
        viewModel?.fetchData { [weak self]  in
            DispatchQueue.main.async {
                if let dataSource = self?.viewModel?.dataSource, !dataSource.isEmpty {
                    self?.startStopActivityIndicator(isAnimating: false)
                    self?.tableView.reloadData()
                } else {
                    self?.tableView.isHidden = true
                    self?.showErrorView(with: self?.viewModel?.errorMsg ?? "") { _ in
                        self?.populateTableView()
                    }
                }
            }
        }
    }
}

// MARK: - Table View Delegate

extension PRListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        PRInfoTableViewCell.estimatedHeight
    }
}

// MARK: - Table View Datasource

extension PRListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PRInfoTableViewCell.identifier, for: indexPath) as? PRInfoTableViewCell else { return UITableViewCell() }
        if let dataModel = viewModel?.dataSource?[indexPath.row] {
            cell.viewModel = PRInfoTableViewCellViewModel(dataModel: dataModel)
            cell.configure()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

