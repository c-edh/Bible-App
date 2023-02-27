//
//  BibleViewModel.swift
//  PersonalBibleApp
//
//  Created by Corey Edh on 2/22/23.
//

import Foundation

protocol BibleViewModelProtocol: ObservableObject{
    nonisolated var chapter: ChapterModel? { get set}
    func getChapterData(bookName: BookModel, chapterNumber: Int, bibleTrasnaltion: BibleTranslation) async
    
    nonisolated func getVerse() -> [VerseModel]
}

@MainActor
class BibleViewModel: BibleViewModelProtocol{
    
    @Published var chapter: ChapterModel? = nil
    
    private let networkManager = NetworkManager()
    
    func getVerse() -> [VerseModel]{
        return chapter?.verses ?? [VerseModel(book_id: nil, book_name: nil, chapter: nil, verse: nil, text: nil)]
    }
    
    func getChapterData(bookName: BookModel, chapterNumber: Int, bibleTrasnaltion: BibleTranslation) async{
        do {
            let newChapter = try await networkManager.getData(api: .getWholeChapter(book: bookName, chapterNumber: chapterNumber, translation: bibleTrasnaltion))
            chapter = newChapter
        } catch  {
            print(error)
        }
    }
}
