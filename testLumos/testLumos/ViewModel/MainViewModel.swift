//
//  MainViewModel.swift
//  testLumos
//
//  Created by sem1 on 1.02.23.
//

import Foundation

protocol MainRequest: AnyObject {
    func updateTable()
}

class MainViewModel {
    
    private let coordinator: AppCoordinator
    private let networkingManager = NetworkingManager()
    weak var delegate: MainRequest?
    var newsModel: NewsModel?
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        setupMainInfo()
    }
    
    func setupMainInfo() {
        networkingManager.request(endpoint: NewsAPI.link) { (result: Result<NewsModel, NetworkingError>) in
            switch result {
            case .success(let result):
                self.newsModel = result
                self.delegate?.updateTable()
            case .failure(let error):
                print(error)
            }
        }
    }
}
