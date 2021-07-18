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
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var updateButton: UIButton!
    
    override func viewDidLoad() {
        configureView()
        updateEmployeDetails()
    }
    
    private func configureView() {
        
        let tapGuester = UITapGestureRecognizer(target: self, action: #selector(addProfilePhoto))
        tapGuester.numberOfTapsRequired = 1
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(tapGuester)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        title = viewModel.title
        submitButton.isHidden = viewModel.showUpdateButton
        updateButton.isHidden = !viewModel.showUpdateButton
    }
    
    private func updateEmployeDetails() {
        guard let employeRecord = viewModel.employeDetails else {
            return
        }
        phoneTextField.text = employeRecord.phone
        employeIDTextfield.text = employeRecord.employeID
        nameTextField.text = employeRecord.name
        profileImageView.image = employeRecord.profileImage
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel.viewDidDisapper()
    }
    
    @IBAction func updateButtonTapped(_ sender: Any) {
        guard let nameValue = nameTextField.text,
              let employeId = employeIDTextfield.text,
              let phoneNumber = phoneTextField.text,
              let imageData = profileImageView.image?.pngData() else {
            return
        }
        viewModel.updateEmployeData(name: nameValue,
                                    phone: phoneNumber,
                                    employeID: employeId,
                                    profileImage: imageData)
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        guard let nameValue = nameTextField.text,
              let employeId = employeIDTextfield.text,
              let phoneNumber = phoneTextField.text,
              let imageData = profileImageView.image?.pngData() else {
            return
        }
        viewModel.saveEmployeData(name: nameValue,
                                  phone: phoneNumber,
                                  employeID: employeId,
                                  profileImage: imageData)
    }
    
    @objc
    private func addProfilePhoto() {
        viewModel.addProfileImageButtonTapped(receivedImage: { [weak self] image in
            DispatchQueue.main.async {
                self?.profileImageView.image = image
            }
        })
    }
    
    
    deinit {
        debugPrint("Deinintialized AddEmployeeDetailsViewController")
    }
}

extension AddEmployeeDetailsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
