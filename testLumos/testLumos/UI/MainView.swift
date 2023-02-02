//
//  MainView.swift
//  testLumos
//
//  Created by sem1 on 1.02.23.
//

import UIKit

class MainView: UIView {
    
    let newsTableView = NewsTableView()

    init() {
        super.init(frame: .zero)
        mainSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func mainSetup() {
        backgroundColor = .systemGray
        setupLayouts()
        setupLayoutConstraints()
    }
    
    private func setupLayouts() {
        [newsTableView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            newsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            newsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
