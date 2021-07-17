//
//  HomeViewController.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 16/07/21.
//

import UIKit

class HomeViewController: UIViewController {

    var viewModel: HomeViewModelType!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
}
