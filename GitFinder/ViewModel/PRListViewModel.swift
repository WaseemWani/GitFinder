//
//  PRListViewModel.swift
//  GitFinder
//
//  Created by Waseem Wani on 27/08/22.
//

import Foundation

class PRListViewModel {
    
    var dataSource: [PRInfoDataModel]?
    var errorMsg: String?
    
    func fetchData(completion: @escaping (() -> Void)) {
        NetworkManager.fetchClosedPRs() { [weak self] result in
            switch result {
                case .error(let error):
                    self?.dataSource = nil
                    self?.errorMsg = error.localizedDescription
                    debugPrint(error.localizedDescription)
                    completion()
                case .success(let data):
                    if data.isEmpty {
                        self?.dataSource = nil
                        self?.errorMsg = "No data available!"
                        completion()
                    } else {
                        self?.dataSource = data
                        completion()
                    }
                }
        }
    }
    
}
