//
//  ViewController.swift
//  testLumos
//
//  Created by sem1 on 1.02.23.
//

import UIKit

class MainViewController: UIViewController {
    
    private let _view = MainView()
    private let viewModel: MainViewModel
    
    override func loadView() {
        view = _view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainSetup()
    }

    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func mainSetup() {
        _view.newsTableView.tableView.delegate = self
        _view.newsTableView.tableView.dataSource = self
        configureNavigationItems()
    }
    
    private func configureNavigationItems() {
        navigationItem.title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.sizeToFit()
        _view.newsTableView.tableView.contentInsetAdjustmentBehavior = .never
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reuseID, for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
}
