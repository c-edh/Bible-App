//
//  BibleModel.swift
//  PersonalBibleApp
//
//  Created by Corey Edh on 2/22/23.
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



enum BooksInBible: CaseIterable{
    
    case Genesis
    case Exodus
    case Leviticus
    case Numbers
    case Deuternonomy
    case Joshua
    case Judges
    case Ruth
    case Samuel1
    case Samuel2
    case Samuel3
    case Kings1
    case Kings2
    case Chronicles1
    case Chronicles2
    case Ezra
    case Nehemiah
    case Esther
    case Job
    case Psalms
    case Proverbs
    case Ecclesiastes
    case SongOfSongs
    case Isaiah
    case Jeremiah
    case Lamentations
    case Ezekiel
    case Daniel
    case Hosea
    case Joel
    case Amos
    case Obadiah
    case Jonah
    case Micah
    case Nahum
    case Habakkuk
    case Zephaniah
    case Haggai
    case Zechariah
    case Malachi
    case Matthew
    case Mark
    case Luke
    case John
    case Acts
    case Romans
    case Corinthians1
    case Corinthians2
    case Galatians
    case Ephesians
    case Philippians
    case Colossians
    case Thessalonians1
    case Thessalonians2
    case Timothy1
    case Timothy2
    case Titus
    case Philemon
    case Hebrews
    case James
    case Peter1
    case Peter2
    case John1
    case John2
    case John3
    
    
    
}


