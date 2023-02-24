//
//  BibleViewModel.swift
//  PersonalBibleApp
//
//  Created by Corey Edh on 2/22/23.
//

import Foundation

protocol BibleViewModelProtocol: ObservableObject{
    nonisolated var chapter: ChapterModel? { get set}
    
    
    func getChapter(bookName: BooksInBible, chapterNumber: Int, bibleTrasnaltion: BibleTranslation) async

}

@MainActor
class BibleViewModel: BibleViewModelProtocol{
    
    
    @Published var chapter: ChapterModel? = nil
    
    private let networkManager = NetworkManager()
    
    func getChapter(bookName: BooksInBible, chapterNumber: Int, bibleTrasnaltion: BibleTranslation) async{
        do {
            chapter = try await networkManager.getData(api: .getWholeChapter(bookName: bookName, chapterNumber: chapterNumber, translation: bibleTrasnaltion))
        } catch  {
            print(error)
        }
    }
    
}
