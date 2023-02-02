//
//  NewsView.swift
//  testLumos
//
//  Created by sem1 on 2.02.23.
//

import UIKit

class NewsView: UIView {
    
    lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var newsHeaderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textAlignment = .right
        return label
    }()
    
    lazy var newsTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "Helvetica", size: 35)
        textView.backgroundColor = .gray
        return textView
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
        [newsImageView,newsHeaderLabel,newsTextView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            newsImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsImageView.heightAnchor.constraint(equalToConstant: 260),
            
            newsHeaderLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsHeaderLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor),
            newsHeaderLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            newsTextView.topAnchor.constraint(equalTo: newsHeaderLabel.bottomAnchor, constant: 10),
            newsTextView.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsTextView.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsTextView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(with model: NewsModel.Articles) {
        newsImageView.loadImageFromUrl(urlString: model.urlToImage ?? "")
        newsHeaderLabel.text = "\(model.author ?? "") \(model.publishedAt.getDate())"
        newsTextView.text = model.content
    }
    
}
