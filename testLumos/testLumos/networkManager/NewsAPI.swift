import Foundation
import CoreLocation

enum NewsAPI: API {
    
    case link
    
    var scheme: HTTPScheme {
        switch self {
        case .link:
            return .https
        }
    }
    var method: HTTPMethod {
        switch self {
        case .link:
            return .get
        }
    }
    var baseURL: String {
        switch self {
        case .link:
            return "newsapi.org"
        }
    }
        
    var path: String {
        switch self {
        case .link:
            return "/v2/everything"
        }
    }
        
    var apiParameters: [URLQueryItem] {
        switch self {
        case .link:
            return [
                URLQueryItem(name: "q", value: "tesla"),
                URLQueryItem(name: "from", value: "2023-02-01"),
                URLQueryItem(name: "sortBy", value: "publishedAt"),
                URLQueryItem(name: "apiKey", value: "0ef07d89748b44afa5658d9c4d0f1592")]
        }
    }
}

// https://newsapi.org/v2/everything?q=tesla&from=2023-01-01&sortBy=publishedAt&apiKey=API_KEY
