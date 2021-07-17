//
//  HomeViewModel.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 16/07/21.
//

import Foundation

protocol HomeViewModelType {
    var title: String { get }
}

final class HomeViewModel: HomeViewModelType {
    var title: String = "Home"
}
