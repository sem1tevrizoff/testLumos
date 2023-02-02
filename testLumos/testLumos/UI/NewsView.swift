//
//  NewsView.swift
//  testLumos
//
//  Created by sem1 on 2.02.23.
//

import UIKit

class NewsView: UIView {
    
    lazy var contentNewsView = ContentNewsView()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()

    init() {
        super.init(frame: .zero)
        mainSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func mainSetup() {
        setupLayouts()
        setupLayoutConstraints()
    }
    
    private func setupLayouts() {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentNewsView)
        contentNewsView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentNewsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentNewsView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentNewsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentNewsView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentNewsView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    
}
