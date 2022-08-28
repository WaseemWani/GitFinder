//
//  PRInfoTableViewCellModel.swift
//  GitFinder
//
//  Created by Waseem Wani on 28/08/22.
//

import Foundation

class PRInfoTableViewCellViewModel {
    
    var dataModel: PRInfoDataModel
    
    init(dataModel: PRInfoDataModel) {
        self.dataModel = dataModel
    }
    
    func fetchUserImage(urlStr: String?, comletion: @escaping ((Data?) -> Void)) {
        NetworkManager.fetchUserImage(urlString: urlStr) { result in
            if let imageData = result {
                comletion(imageData)
//                DispatchQueue.main.async {
//                    self?.userImageView?.image = UIImage(data: imageData)
//                }
            } else {
                comletion(nil)
                debugPrint("failed to fetch profile image")
            }
        }
    }
}

