//
//  PRInfoTableViewCell.swift
//  GitFinder
//
//  Created by Waseem Wani on 24/08/22.
//

import UIKit

class PRInfoTableViewCell: UITableViewCell {
    
    @IBOutlet var prTitleLabel: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var prCreatedDateLabel: UILabel!
    @IBOutlet var prClosedDateLabel: UILabel!
    @IBOutlet var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.backgroundColor = .white
        let margins = UIEdgeInsets(top: 10, left: 0, bottom: 5, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
        userImageView.layer.borderWidth = 2
        userImageView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func configure(with data: DataModel) {
        prTitleLabel.text = data.prTitle
        userNameLabel.text = data.name
        prCreatedDateLabel.text = data.prCreatedDate
        prClosedDateLabel.text = data.prClosedDate
    }
}
