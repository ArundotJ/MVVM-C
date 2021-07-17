//
//  PassportsListViewModel.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 16/07/21.
//

import Foundation

protocol PassportsListViewModelType {
    var title: String { get set }
}

final class PassportsListViewModel: PassportsListViewModelType {
    
    var title: String = "Passports"
    
    
}
