//
//  BibleDecodeModel.swift
//  PersonalBibleApp
//
//  Created by Corey Edh on 2/26/23.
//

import Foundation

struct ChapterModel: Decodable{
    
    let chapter: String?
    let verses: [VerseModel]?
    
    enum CodingKeys: String, CodingKey {
        case chapter = "reference"
        case verses = "verses"
    }
}

struct VerseModel: Decodable, Hashable{
    let book_id: String?
    let book_name: String?
    let chapter: Int?
    let verse: Int?
    let text: String?
}
