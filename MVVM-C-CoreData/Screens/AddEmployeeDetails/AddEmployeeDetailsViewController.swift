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
        self.navigationController?.navigationBar.prefersLargeTitles = true
        title = viewModel.title
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel.viewDidDisapper()
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        guard let nameValue = nameTextField.text,
              let employeId = Int(employeIDTextfield.text ?? "0"),
              let phoneNumber = Int(phoneTextField.text ?? "0"),
              let imageData = profileImageView.image?.pngData() else {
            return
        }
        viewModel.saveEmployeData(employe: Employe(name: nameValue,
                                                   employeID: employeId,
                                                   phone: phoneNumber,
                                                   profileImage: imageData))
    }
    deinit {
        debugPrint("Deinintialized AddEmployeeDetailsViewController")
    }
}

extension AddEmployeeDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
}
