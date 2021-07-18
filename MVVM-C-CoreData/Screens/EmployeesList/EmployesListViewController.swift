//
//  EmployesListViewController.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 16/07/21.
//

import UIKit

class EmployesListViewController: UIViewController {

    var viewModel: EmployesListViewModelType!
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.tableFooterView = UIView()
        table.register(EmployeItemCell.self, forCellReuseIdentifier: EmployeItemCell.reuseIdentifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.refreshUI = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        configureView()
        // Do any additional setup after loading the view.
    }
    
    private func configureView() {
        title = viewModel.title
        self.tableView.dataSource = self
        self.tableView.delegate = self
        view.backgroundColor = .systemBackground
        self.view.addSubview(self.tableView)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        viewModel.fetchEmployeDetails()
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc
    private func addButtonTapped() {
        viewModel.addButtonTapped()
    }
    
}

extension EmployesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.employeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let employe = viewModel.employeList[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeItemCell.reuseIdentifier, for: indexPath) as? EmployeItemCell else {
            return UITableViewCell()
        }
        cell.configureCell(viewModel: EmployeItemCellViewModel(employe: employe))
        return cell
    }
}

extension EmployesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectEmployeItem(indexPath: indexPath)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [deleteContextualAction()])
    }
}

extension EmployesListViewController {
    
    private func deleteContextualAction() -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "DELETE") { (action, view, completion) in
            debugPrint("Action DElete")
            completion(true)
        }
        action.image = UIImage(systemName: "trash")
        action.backgroundColor = .red
        return action
    }
}
