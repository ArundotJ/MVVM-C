//
//  EmployesListViewController.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 16/07/21.
//

import UIKit

class EmployesListViewController: UIViewController {

    var viewModel: EmployesListViewModelType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        // Do any additional setup after loading the view.
    }
    
    private func configureView() {
        title = viewModel.title
        view.backgroundColor = .systemBackground
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }
    
    @objc
    private func addButtonTapped() {
        viewModel.addButtonTapped()
    }
    
}
