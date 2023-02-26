//
//  BibleViewModelMock.swift
//  PersonalBibleApp
//
//  Created by Corey Edh on 2/23/23.
//

import Foundation


class BibleViewModelMock: BibleViewModelProtocol{
    func getVerse() -> [VerseModel] {
        return [VerseModel(book_id: nil, book_name: nil, chapter: nil, verse: nil, text: nil)]
    }
    

    @Published var chapter: ChapterModel? = nil

    func getChapterData(bookName: BooksInBible, chapterNumber: Int, bibleTrasnaltion: BibleTranslation) async{
        let randomWords = ["The", "Sky", "Blue", "Cow", "Fake", "lafajkfjdkla","Dummy", "afdafaf","afkdakjfakl","niuafa","end\n"]

        var verses: [VerseModel] = []
        for i in 1..<20{
            var sentence: String = ""
            for _ in 1...30{
                sentence += (randomWords.randomElement() ?? "hi")
            }
            verses.append(VerseModel(book_id: "MCK", book_name: "Mock Book", chapter: chapterNumber, verse: i, text: sentence))
        }
        chapter = ChapterModel(chapter: "Mock Data", verses: verses)
    }
    
}
