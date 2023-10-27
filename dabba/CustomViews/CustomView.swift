//
//  CustomView.swift
//  dabba
//
//  Created by Abhilash K George on 26/10/23.
//

import UIKit

class CustomSectionHeaderView: UIView {
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black // Set the background color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 35) // Adjust the font size and style here
        label.textColor = UIColor.white // Set the text color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add the background view
        addSubview(backgroundView)
        backgroundView.addSubview(label)

        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            label.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 15),
            label.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String) {
        label.text = title
    }
}
