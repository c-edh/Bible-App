//
//  BibleModel.swift
//  PersonalBibleApp
//
//  Created by Corey Edh on 2/22/23.
//

import Foundation

enum BibleTranslation: String, CaseIterable, Equatable{
    case kjv = "KJV"
    case web = "Web"
    case clementine = "Clementine"
    case cherokee = "Cherokee"
    
    var fullNameOfTranslation: String {
        switch self{
        case .kjv:
            return "King James Verison"
        case .web:
            return "World English Bible"
        case .clementine:
            return "Clementine Latin Vulgate"
        case .cherokee:
            return "Cherokee New Testament"
        }
    }
}

struct BookModel:Hashable{
    let bookID: String
    let bookName: String
    let amountOfChapters: Int
}

struct BibleBooks{
    static let books: [BookModel] = [.init(bookID: "GEN", bookName: "Genesis", amountOfChapters: 50),
                                     .init(bookID: "EXO", bookName: "Exodus", amountOfChapters: 40),
                                     .init(bookID: "LEV", bookName: "Leviticus", amountOfChapters: 27),
                                     .init(bookID: "NUM", bookName: "Numbers", amountOfChapters: 36),
                                     .init(bookID: "DEU", bookName: "Deuteronomy", amountOfChapters: 34),
                                     .init(bookID: "JOS", bookName: "Joshua", amountOfChapters: 24),
                                     .init(bookID: "JDG", bookName: "Judges", amountOfChapters: 21),
                                     .init(bookID: "RTH", bookName: "Ruth", amountOfChapters: 4),
                                     .init(bookID: "1SM", bookName: "1 Samuel", amountOfChapters: 31),
                                     .init(bookID: "2SM", bookName: "2 Samuel", amountOfChapters: 24),
                                     .init(bookID: "1KI", bookName: "1 Kings", amountOfChapters: 22),
                                     .init(bookID: "2KI", bookName: "2 Kings", amountOfChapters: 25),
                                     .init(bookID: "1CH", bookName: "1 Chronicles", amountOfChapters: 29),
                                     .init(bookID: "2CH", bookName: "2 Chronicles", amountOfChapters: 36),
                                     .init(bookID: "EZR", bookName: "Ezra", amountOfChapters: 10),
                                     .init(bookID: "NEH", bookName: "Nehemiah", amountOfChapters: 13),
                                     .init(bookID: "EST", bookName: "Esther", amountOfChapters: 10),
                                     .init(bookID: "JOB", bookName: "JOB", amountOfChapters: 42),
                                     .init(bookID: "PSA", bookName: "Psalms", amountOfChapters: 150),
                                     .init(bookID: "PRO", bookName: "Proverbs", amountOfChapters: 31),
                                     .init(bookID: "ECC", bookName: "Ecclesiastes", amountOfChapters: 12),
                                     .init(bookID: "SNG", bookName: "Song of Songs", amountOfChapters: 8),
                                     .init(bookID: "ISA", bookName: "Isaiah", amountOfChapters: 66),
                                     .init(bookID: "JER", bookName: "Jeremiah", amountOfChapters: 52),
                                     .init(bookID: "LAM", bookName: "Lamentations", amountOfChapters: 5),
                                     .init(bookID: "EZK", bookName: "Ezekiel", amountOfChapters: 48),
                                     .init(bookID: "DAN", bookName: "Daniel", amountOfChapters: 12),
                                     .init(bookID: "HOS", bookName: "Hosea", amountOfChapters: 14),
                                     .init(bookID: "JOL", bookName: "Joel", amountOfChapters: 3),
                                     .init(bookID: "AMO", bookName: "Amos", amountOfChapters: 8),
                                     .init(bookID: "OBA", bookName: "Obadiah", amountOfChapters: 1),
                                     .init(bookID: "JON", bookName: "Jonah", amountOfChapters: 4),
                                     .init(bookID: "MIC", bookName: "Micah", amountOfChapters: 7),
                                     .init(bookID: "NAM", bookName: "Nahum", amountOfChapters: 3),
                                     .init(bookID: "HAB", bookName: "Habakkuk", amountOfChapters: 3),
                                     .init(bookID: "ZEP", bookName: "Zephaniah", amountOfChapters: 3),
                                     .init(bookID: "HAG", bookName: "Haggai", amountOfChapters: 2),
                                     .init(bookID: "ZEC", bookName: "Zechariah", amountOfChapters: 14),
                                     .init(bookID: "MAL", bookName: "Malachi", amountOfChapters: 4),
                                     .init(bookID: "MAT", bookName: "Matthew", amountOfChapters: 28),
                                     .init(bookID: "MRK", bookName: "Mark", amountOfChapters: 16),
                                     .init(bookID: "LUK", bookName: "Luke", amountOfChapters: 24),
                                     .init(bookID: "JHN", bookName: "John", amountOfChapters: 21),
                                     .init(bookID: "ACT", bookName: "Acts", amountOfChapters: 28),
                                     .init(bookID: "ROM", bookName: "Romans", amountOfChapters: 28),
                                     .init(bookID: "1CO", bookName: "1 Corinthians", amountOfChapters: 16),
                                     .init(bookID: "2CO", bookName: "2 Corinthians", amountOfChapters: 13),
                                     .init(bookID: "GAL", bookName: "Galatians", amountOfChapters: 6),
                                     .init(bookID: "EPH", bookName: "Ephesians", amountOfChapters: 6),
                                     .init(bookID: "PHP", bookName: "Philippians", amountOfChapters: 4),
                                     .init(bookID: "COL", bookName: "Colossians", amountOfChapters: 4),
                                     .init(bookID: "1TH", bookName: "1 Thessalonians", amountOfChapters: 5),
                                     .init(bookID: "2TH", bookName: "2 Thessalonians", amountOfChapters: 3),
                                     .init(bookID: "1TI", bookName: "1 Timothy", amountOfChapters: 5),
                                     .init(bookID: "2TI", bookName: "2 Timothy", amountOfChapters: 4),
                                     .init(bookID: "TIT", bookName: "Titus", amountOfChapters: 3),
                                     .init(bookID: "Philemon", bookName: "Philemon", amountOfChapters: 1), //Philemon isnt working in API, It will instead return Philippians
                                     .init(bookID: "HEB", bookName: "Hebrews", amountOfChapters: 13),
                                     .init(bookID: "JAS", bookName: "James", amountOfChapters: 5),
                                     .init(bookID: "1PE", bookName: "1 Peter", amountOfChapters: 5),
                                     .init(bookID: "2PE", bookName: "2 Peter", amountOfChapters: 3),
                                     .init(bookID: "1JN", bookName: "1 John", amountOfChapters: 5),
                                     .init(bookID: "2JN", bookName: "2 John", amountOfChapters: 1),
                                     .init(bookID: "3JN", bookName: "3 John", amountOfChapters: 1),
                                     .init(bookID: "JUD", bookName: "Jude", amountOfChapters: 1),
                                     .init(bookID: "REV", bookName: "Revelations", amountOfChapters: 22)]
    
}
