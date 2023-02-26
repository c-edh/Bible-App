//
//  BibleAPIModel.swift
//  PersonalBibleApp
//
//  Created by Corey Edh on 2/26/23.
//

import Foundation

enum BibleAPIModel{
    private var baseURL: String { return "https://bible-api.com/" }
    
    case getWholeChapter(book: BooksInBible, chapterNumber: Int, translation: BibleTranslation)
    
    private var fullPath: String{
        var endPoint = ""
        switch self {
        case .getWholeChapter(let book, let chapterNumber, let translation):
            
            //API wont return more than one verse for books with one chapter, you need to give it the range for the verses.
            switch book{
            case .Obadiah:
                endPoint = book.info.id + "%201:1-22"
            case .Philemon:
                endPoint = book.info.id + "%201:1-25"
            case .John2:
                endPoint = book.info.id + "%201:1-13"
            case .John3:
                endPoint = book.info.id + "%201:1-14"
            case .Jude:
                endPoint = book.info.id + "%201:1-24"
            default:
                endPoint = book.info.id + "%20\(chapterNumber)"
            }
            
            switch translation{
            case .web: //Default
                break
            case .kjv:
                endPoint +=  "?translation=kjv"
            case .clementine:
                endPoint += "?translation=clementine"
            }
        }
        return baseURL + endPoint
    }
    
    var url: URL {
        guard let url = URL(string: fullPath) else {
                   preconditionFailure("The url used in \(BibleAPIModel.self) is not valid")
               }
        return url
    }
    
    
}
