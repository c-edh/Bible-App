//
//  BibleAPIModel.swift
//  PersonalBibleApp
//
//  Created by Corey Edh on 2/26/23.
//

import Foundation

enum BibleAPIModel{
    private var baseURL: String { return "https://bible-api.com/" }
    
    case getWholeChapter(book: BookModel, chapterNumber: Int, translation: BibleTranslation)
    
    private var fullPath: String{
        var endPoint = ""
        switch self {
        case .getWholeChapter(let book, let chapterNumber, let translation):
            
            //API wont return more than one verse for books with one chapter, you need to give it the range for the verses.
            switch book.bookID{
            case "Obadiah":
                endPoint = book.bookID + "%201:1-22"
            case "Philemon":
                endPoint = book.bookID + "%201:1-25"
            case "2JN":
                endPoint = book.bookID + "%201:1-13"
            case "3JN":
                endPoint = book.bookID + "%201:1-14"
            case "JUD":
                endPoint = book.bookID + "%201:1-24"
            default:
                endPoint = book.bookID + "%20\(chapterNumber)"
            }
            
            switch translation{

            case .kjv:
                endPoint +=  "?translation=kjv"
            case .clementine:
                endPoint += "?translation=clementine"
            case .cherokee:
                endPoint += "?translation=cherokee"
            default: //Web is Default
                break
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
