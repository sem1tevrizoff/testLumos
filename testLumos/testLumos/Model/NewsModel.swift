//
//  NewsModel.swift
//  testLumos
//
//  Created by sem1 on 1.02.23.
//

import Foundation

struct NewsModel: Codable {
    
    let articles: [Articles]
    
    struct Articles: Codable {
        
        let author: String?
        let title: String?
        let description: String?
        let publishedAt: String
        let content: String
        let urlToImage: String?
    }
}
