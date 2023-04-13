//
//  VendorCell.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit

class VendorCell: UITableViewCell {
    
    let vendorLogo = UIImageView()
    
    let vendorNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
