//
//  EmployeItemCell.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 17/07/21.
//

import UIKit

final class EmployeItemCell: UITableViewCell {
    
    static let reuseIdentifier = "EmployeItemCellIdentifier"
    
    private let nameTextField = UILabel()
    private let phoneNumber = UILabel()
    private let employeID = UILabel()
    private let profileImageView = UIImageView()
    private let imageHeightWidth: CGFloat = 80
    private let padding: CGFloat = 15
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [nameTextField, phoneNumber, employeID].forEach({
            $0.font = .systemFont(ofSize: 18, weight: .medium)
            $0.textColor = .label
        })
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.cornerRadius = imageHeightWidth/2
        profileImageView.clipsToBounds = true
        
        
        let labelStackView = UIStackView(arrangedSubviews: [nameTextField, phoneNumber, employeID])
        labelStackView.axis = .vertical
        labelStackView.spacing = 10
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let mainStackView = UIStackView(arrangedSubviews: [profileImageView, labelStackView])
        mainStackView.axis = .horizontal
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.spacing = 15
        contentView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
        ])
        let imageWidthAnchor = profileImageView.widthAnchor.constraint(equalToConstant: imageHeightWidth)
        imageWidthAnchor.isActive = true
        imageWidthAnchor.priority = UILayoutPriority(rawValue: 999)
        let imageHeightAnchor = profileImageView.heightAnchor.constraint(equalToConstant: imageHeightWidth)
        imageHeightAnchor.isActive = true
        imageHeightAnchor.priority = UILayoutPriority(rawValue: 999)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(viewModel: EmployeItemCellViewModelType) {
        nameTextField.text = "Name: \(String(describing: viewModel.name ?? ""))"
        employeID.text = "Emp ID: \(String(describing: viewModel.employeID ?? 0))"
        phoneNumber.text = "Phone: \(String(describing: viewModel.phoneNumber ?? 0))"
        profileImageView.image = UIImage(data: viewModel.profileImageData ?? Data())
    }
}
