//
//  PRInfoTableViewCell.swift
//  GitFinder
//
//  Created by Waseem Wani on 24/08/22.
//

import UIKit

class PRInfoTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet var prTitleLabel: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var prCreatedDateLabel: UILabel!
    @IBOutlet var prClosedDateLabel: UILabel!
    @IBOutlet var userImageView: UIImageView!
    
    //MARK: - Variables
    static let identifier = "PRInfoTableViewCell"
    static let nib = UINib(nibName: "PRInfoTableViewCell", bundle: Bundle.main)
    static let estimatedHeight: CGFloat = 164.0
    var viewModel: PRInfoTableViewCellViewModel?
    
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
    
    func configure() {
        prTitleLabel.text = viewModel?.dataModel.prTitle
        userNameLabel.text = viewModel?.dataModel.user?.login
        prCreatedDateLabel.text = Utilities.getFormatted(from: viewModel?.dataModel.prCreatedDate ?? "")
        prClosedDateLabel.text = Utilities.getFormatted(from: viewModel?.dataModel.prClosedDate ?? "")
        fetchUserImage(urlString: viewModel?.dataModel.user?.userImage)
    }
    
    private func fetchUserImage(urlString: String?) {
        viewModel?.fetchUserImage(urlStr: urlString) { [weak self] imageData in
            if let imgData = imageData {
                DispatchQueue.main.async {
                    self?.userImageView?.image = UIImage(data: imgData)
                }
            } else {
                debugPrint("failed to fetch profile image")
            }
        }
    }
}
