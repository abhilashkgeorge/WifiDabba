//
//  ContactTableViewCell.swift
//  dabba
//
//  Created by Abhilash K George on 26/10/23.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailAddressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(model: UserModel) {
        titleLabel.text = model.name
        emailAddressLabel.text = model.email
    }
    
}
