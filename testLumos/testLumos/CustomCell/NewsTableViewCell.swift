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
        return label
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
