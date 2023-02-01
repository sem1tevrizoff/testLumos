//
//  MainViewModel.swift
//  testLumos
//
//  Created by sem1 on 1.02.23.
//

import Foundation

class MainViewModel {
    
    private let coordinator: AppCoordinator
    private let networkingManager = NetworkingManager()
    var newsModel: NewsModel?
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func setupMainInfo(completion: @escaping () -> ()) {
        networkingManager.request(endpoint: NewsAPI.link) { (result: Result<NewsModel, NetworkingError>) in
            switch result {
            case .success(let result):
                self.newsModel = result
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}
