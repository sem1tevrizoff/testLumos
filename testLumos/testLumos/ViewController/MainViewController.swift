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
    
    private lazy var myRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshTableView(sender:)), for: .valueChanged)
        return refreshControl
    }()
    
    override func loadView() {
        view = _view
        viewSettings()
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
        configureNewsRequest()
        configureNavigationItems()
    }
    
    private func configureNavigationItems() {
        navigationItem.title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.sizeToFit()
        _view.newsTableView.tableView.contentInsetAdjustmentBehavior = .never
    }
    
    private func configureNewsRequest() {
        self.viewModel.newsRequest { [weak self] in
            DispatchQueue.main.async {
                self?._view.newsTableView.tableView.reloadData()
            }
        }
    }
    
    @objc func refreshTableView(sender: UIRefreshControl) {
        self.viewModel.newsRequest { [weak self] in
            DispatchQueue.main.async {
                self?._view.newsTableView.tableView.reloadData()
                self?.myRefreshControl.endRefreshing()
            }
        }
    }
    
    private func viewSettings() {
        _view.newsTableView.tableView.delegate = self
        _view.newsTableView.tableView.dataSource = self
        _view.newsTableView.tableView.addSubview(myRefreshControl)
        _view.newsTableView.tableView.refreshControl = myRefreshControl
    }
    
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.newsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reuseID, for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        
        let model = viewModel.newsModel[indexPath.row]
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let news = viewModel.newsModel[indexPath.row]
        viewModel.goToNewsScreen(with: news)
    }
    
}
