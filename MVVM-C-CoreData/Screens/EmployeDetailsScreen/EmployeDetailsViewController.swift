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
        viewModel.didUpdateChages = { [weak self] in
            self?.configureView()
        }
    }
    
    private func configureView() {
        phoneLabel.text = viewModel.phoneNumber
        employeLabel.text = viewModel.employeID
        nameLabel.text = viewModel.name
        profileImageView.image = viewModel.profileImage
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel.viewDidDisappear()
        super.viewDidDisappear(animated)
    }
    
    @IBAction func updateButtonTapped(_ sender: Any) {
        viewModel.updateButtonTapped()
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        viewModel.deleteButtonTapped()
    }
    
}
