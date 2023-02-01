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
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
