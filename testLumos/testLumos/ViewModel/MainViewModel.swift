//
//  MainViewModel.swift
//  testLumos
//
//  Created by sem1 on 1.02.23.
//

import Foundation
import Combine

class MainViewModel {
    
    let coordinator: AppCoordinator
    private let networkingManager = NetworkingManager()
    var newsModel = [NewsModel.Articles]()
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func newsRequest(completion: @escaping () -> ()) {
        networkingManager.request(endpoint: NewsAPI.link) { (result: Result<NewsModel, NetworkingError>) in
            switch result {
            case .success(let result):
                self.newsModel = result.articles
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func goToNewsScreen(with model: NewsModel.Articles) {
        coordinator.createNewsScreen(with: model)
    }
}
