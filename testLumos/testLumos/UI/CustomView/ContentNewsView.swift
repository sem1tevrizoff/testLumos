//
//  ContentNewsView.swift
//  testLumos
//
//  Created by sem1 on 2.02.23.
//

import UIKit

class ContentNewsView: UIView {
    
    var heightBannerCollectionViewConstraint: NSLayoutConstraint?
    
    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var newsHeaderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 15)
        label.layer.borderWidth = 0.5
        label.textAlignment = .right
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 25)
        label.layer.borderWidth = 0.5
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var newsTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 35)
        label.numberOfLines = 0
        label.backgroundColor = .gray
        return label
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
        [newsImageView,titleLabel,newsHeaderLabel,newsTextLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: -50),
            newsImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsImageView.heightAnchor.constraint(equalToConstant: 260),

            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            newsHeaderLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsHeaderLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            newsHeaderLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            newsTextLabel.topAnchor.constraint(equalTo: newsHeaderLabel.bottomAnchor, constant: 10),
            newsTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(with model: NewsModel.Articles) {
        newsImageView.loadImageFromUrl(urlString: model.urlToImage ?? "" , placeholder: UIImage(systemName: "photo.artframe"))
        titleLabel.text = model.title ?? ""
        newsHeaderLabel.text = "\(model.author ?? "") \(model.publishedAt.getDate())"
        newsTextLabel.text = model.content
    }
}
