//
//  NewsViewController.swift
//  testLumos
//
//  Created by sem1 on 2.02.23.
//

import UIKit

class NewsViewController: UIViewController {
    
    private let viewModel: NewsViewModel
    private let newsModel: NewsModel.Articles
    private let _view = NewsView()
    
    override func loadView() {
        view = _view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        _view.backgroundColor = .gray
        _view.configure(with: newsModel)
    }
    
    init(viewModel: NewsViewModel, newsModel: NewsModel.Articles) {
        self.viewModel = viewModel
        self.newsModel = newsModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
