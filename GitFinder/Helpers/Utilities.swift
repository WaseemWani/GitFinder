//
//  Utilities.swift
//  GitFinder
//
//  Created by Waseem Wani on 28/08/22.
//

import Foundation
import UIKit

class Utilities {
    
    static func getFormatted(from dateString: String) -> String? {
        let dateFormatGetter = DateFormatter()
        dateFormatGetter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        guard let date = dateFormatGetter.date(from: dateString) else { return nil }
        return dateFormatter.string(from: date)
    }    
}
