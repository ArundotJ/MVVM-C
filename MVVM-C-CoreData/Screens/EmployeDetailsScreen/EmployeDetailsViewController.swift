//
//  EmployeDetailsViewController.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 17/07/21.
//

import UIKit

class EmployeDetailsViewController: UIViewController {
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var employeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    var viewModel: EmployeDetailsViewModelType!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        phoneLabel.text = viewModel.phoneNumber
        employeLabel.text = viewModel.employeID
        nameLabel.text = viewModel.name
        profileImageView.image = viewModel.profileImage
    }
    
    @IBAction func updateButtonTapped(_ sender: Any) {
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
    }
    
}
