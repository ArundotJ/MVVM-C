//
//  ImagePickerCoordinator.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 17/07/21.
//

import UIKit

final class ImagePickerCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    weak var parentCoordinator: AddEmployeeDetailsCoordinator?
    
    init(navigation: UINavigationController, parentCoordinator: AddEmployeeDetailsCoordinator) {
        self.navigationController = navigation
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        self.navigationController.present(imagePickerController, animated: true, completion: nil)
    }
}

extension ImagePickerCoordinator: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            return
        }
        DispatchQueue.main.async {
            self.parentCoordinator?.didFinishImagePicking(from: self, image: selectedImage)
        }
    }
}
