//
//  ContactDetailTableViewCell.swift
//  dabba
//
//  Created by Abhilash K George on 26/10/23.
//

import UIKit

class ContactDetailTableViewCell: UITableViewCell {
    
    static let identifier = "ContactDetailTableViewCell"
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var AddressLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        AddressLabel.sizeToFit()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(model: UserModel) {
        nameLabel.text = model.name
        usernameLabel.text = model.username
        emailLabel.text = model.email
        websiteLabel.text = model.website
        AddressLabel.text = addressString(address: model.address)
        //detailLabel.text = model.name
    }
    
    func addressString(address: Address) -> String {
        return "\(address.street) - Street, \(address.suite) - Suite, \(address.city) - City, \(address.zipcode) - ZipCode"
    }
    
}
