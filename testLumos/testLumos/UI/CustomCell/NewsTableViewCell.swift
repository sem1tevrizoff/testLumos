//
//  NewsTableViewCell.swift
//  testLumos
//
//  Created by sem1 on 1.02.23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    static var reuseID: String {
        String(describing: self)
    }
    
    private lazy var titleImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont(name: "Helvetica", size: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        [titleImage, titleLabel, authorLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            titleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            titleImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            titleImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            titleImage.widthAnchor.constraint(equalToConstant: 180),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: titleImage.trailingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            authorLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(with model: NewsModel.Articles) {
        titleImage.loadImageFromUrl(urlString: model.urlToImage ?? "" , placeholder: UIImage(systemName: "photo.artframe"))
        titleLabel.text = model.title
        authorLabel.text = model.publishedAt.getDate()
    }
}

