//
//  AddEmployeeDetailsViewController.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 16/07/21.
//

import UIKit
import Combine

final class AddEmployeeDetailsViewController: UIViewController {

    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var employeIDTextfield: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    var viewModel: AddEmployeeDetailsViewModelType!
    
    override func viewDidLoad() {
        configureView()
    }
    
    private func configureView() {
        
        let tapGuester = UITapGestureRecognizer(target: self, action: #selector(addProfilePhoto))
        tapGuester.numberOfTapsRequired = 1
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(tapGuester)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        title = viewModel.title
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel.viewDidDisapper()
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        guard let nameValue = nameTextField.text,
              let employeId = employeIDTextfield.text,
              let phoneNumber = Int(phoneTextField.text ?? "0"),
              let imageData = profileImageView.image?.pngData() else {
            return
        }
        viewModel.saveEmployeData(employe: Employe(name: nameValue,
                                                   employeID: Int(employeId),
                                                   phone: phoneNumber,
                                                   profileImage: imageData))
    }
    
    @objc
    private func addProfilePhoto() {
        viewModel.addProfileImageButtonTapped(receivedImage: { [weak self] image in
            self?.profileImageView.image = image
        })
    }
    
    
    deinit {
        debugPrint("Deinintialized AddEmployeeDetailsViewController")
    }
}
