//
//  NetworkManager.swift
//  PersonalBibleApp
//
//  Created by Corey Edh on 2/22/23.
//

import Foundation


struct NetworkManager{
    
    
    func getData(api: BibleAPI) async throws -> ChapterModel{
        
        let request = URLRequest(url: api.url)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let chapter = try JSONDecoder().decode(ChapterModel.self, from: data)
        
        return chapter
    }
    
}


enum BibleAPI{
    private var baseURL: String { return "https://bible-api.com/" }
    
    case getWholeChapter(bookName: BooksInBible, chapterNumber: Int, translation: BibleTranslation)
    
    
    private var fullPath: String{
        var endPoint = ""
        switch self {
        case .getWholeChapter(let bookName, let chapterNumber, let translation):
            endPoint = bookName.rawValue + "%20\(chapterNumber)"
            switch translation{
            case .kjv:
                endPoint +=  "?translation=kjv"
            case .web:
                break
            case .cherokee:
                endPoint +=  "?translation=cherokee"
            case .clementine:
                endPoint += "?translation=clementine"
            }
        }
        return baseURL + endPoint
    }
    
    var url: URL {
        guard let url = URL(string: fullPath) else {
                   preconditionFailure("The url used in \(BibleAPI.self) is not valid")
               }
        return url
    }

    
    
    
}
