//
//  AppCoordinator.swift
//  testLumos
//
//  Created by sem1 on 1.02.23.
//

import Foundation
import UIKit

class AppCoordinator {
    
    private weak var screen: UIViewController?
    
    func start() -> UINavigationController {
        createMainScreen()
    }
    
    private func createMainScreen() -> UINavigationController {
        let navigationViewController = UINavigationController()
        let viewModel = MainViewModel(coordinator: self)
        let viewController = MainViewController(viewModel: viewModel)
        screen = viewController
        navigationViewController.viewControllers = [viewController]
        return navigationViewController
    }
    
    func createNewsScreen(with model: NewsModel.Articles) {
        let viewModel = NewsViewModel(coordinator: self)
        let viewController = NewsViewController(viewModel: viewModel, newsModel: model)
        let navVC = UINavigationController(rootViewController: viewController)
        navVC.modalPresentationStyle = .fullScreen
        self.screen?.navigationController?.pushViewController(viewController, animated: true)
    }
}
