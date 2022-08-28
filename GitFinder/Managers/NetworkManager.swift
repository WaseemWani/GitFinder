//
//  NetworkManager.swift
//  GitFinder
//
//  Created by Waseem Wani on 27/08/22.
//

import Foundation

enum Result {
    case success([PRInfoDataModel])
    case error(Error)
}

class NetworkManager {
    
    class func fetchClosedPRs(completion: @escaping ((Result) -> Void)) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.github.com"
        urlComponents.path = "/repos/WaseemWani/GitFinder/pulls"
        urlComponents.queryItems = {
          var queryItems = [URLQueryItem]()
          queryItems.append(URLQueryItem(name: "state", value: "all"))
          return queryItems
        }()
        
        guard let urlString = urlComponents.url else {
            debugPrint("no url string found to create URL")
            return
        }
        debugPrint(urlString)
        let request = URLRequest(url: urlString)
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let fetchedData = data {
                do {
                    let result = try JSONDecoder().decode([PRInfoDataModel].self, from: fetchedData)
                    let res : Result = .success(result)
                        completion(res)
                } catch let error {
                    let error: Result = .error(error)
                    completion(error)
                }
            } else if let err = error {
                let res: Result = .error(err)
                print("--", err.localizedDescription, res)
                completion(res)
                return
            }
            
        }
        dataTask.resume()
    }
    
    class func fetchUserImage(urlString: String?, completion: @escaping ((Data?) -> Void)) {
        guard let urlStr = urlString, let url = URL(string: urlStr) else {
            debugPrint("failed to create URL")
            return
        }
        let request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let fetchedData = data else {
                completion(nil)
                return
            }
            completion(fetchedData)
        }
        
        dataTask.resume()
    }
}
