//
//  ContentView.swift
//  PersonalBibleApp
//
//  Created by Corey Edh on 2/22/23.
//

import SwiftUI
import CoreData

struct ContentView<Model>: View where Model: BibleViewModelProtocol {
    @StateObject var viewModel: Model
    
    @AppStorage("book") var selectedBook: Int = 0
    @AppStorage("page") var chapter: Int = 1
    @AppStorage("translation") var selectedTranslation: BibleTranslation = .kjv
    
    @State private var bionicReading: Bool = false
    
    var body: some View {
        //MARK: - Top
        VStack{
            SelectorsView(selectedTranslation: $selectedTranslation,
                          selectedBook: $selectedBook, chapter: $chapter,
                          updateInfo: updateInfo)
            
            //MARK: - Scroll View (With all the verses)
            ScrollView{
                if viewModel.chapter != nil{
                    ForEach(viewModel.getVerse(), id: \.self) { verse in
                        if bionicReading{
                            let wordsInVerse = verse.text?.components(separatedBy: " ")
                            BionicText(wordsInVerse)
                        }else{
                            HStack{
                                Text(String(verse.verse ?? 0))
                                    .frame(maxHeight: .infinity, alignment: .top)
                                Text((verse.text ?? "Error, No Text Available"))
                            }
                        }
                    }
                    .padding([.trailing,.leading])
                }else{
                    Text("Loading")
                }
                
            }.padding(.top)
            
            //MARK: - Bottom
            HStack{
               
                Button {
                    chapter -= 1
                    if chapter < 1{
                        selectedBook -= 1
                        if selectedBook<0{
                            selectedBook = 65
                        }
                        chapter = BibleBooks.books[selectedBook].amountOfChapters
                    }
                    updateInfo()
                } label: {
                    Image(systemName: "arrowshape.left.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                        .shadow(radius: 6)
                    
                }
               
                Spacer()
                
                Button{
                    bionicReading.toggle()
                }label:{
                    Image(systemName: "text.book.closed").font(.system(size: 30)).foregroundColor(.black)
                }
                
                Spacer()
               
                Button {
                    chapter += 1
                    if chapter > BibleBooks.books[selectedBook].amountOfChapters{
                        selectedBook+=1
                        if selectedBook==BibleBooks.books.count{
                            selectedBook = 0
                        }
                        chapter = 1
                    }
                    updateInfo()
                } label: {
                    Image(systemName: "arrowshape.right.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                        .shadow(radius: 6)
                }
            }.padding([.leading,.trailing], 50)
        }.task {
            updateInfo()
        }
    }

    private func splitString(_ word: String) -> (Substring, Substring)?{
        if word.isEmpty{
            return nil
        }
        let halfLength = word.count / 2 + 1
        let firstHalf = word[0..<halfLength]
        let secondHalf = word[halfLength..<word.count]
        return (firstHalf, secondHalf)
    }
    
    private func BionicText(_ words: [String]?) -> Text{
        words?.reduce(Text("").font(.system(size:20)).fontWeight(.heavy),{
            let (firstHalf, secondHalf) = splitString($1) ?? ("","")
            
            return $0 + Text(String(firstHalf)).font(.system(size: 20,weight: .semibold)) + Text(String(secondHalf) + "   ").font(.system(size:20, weight: .light))
        }) ?? Text("Error, Problem getting Text")
        
    }
    
    private func updateInfo(){
            Task{
                await viewModel.getChapterData(bookName: BibleBooks.books[selectedBook],
                                           chapterNumber: chapter,
                                           bibleTrasnaltion: selectedTranslation)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: BibleViewModelMock())
        
    }
}

struct SelectorsView: View {
    @Binding var selectedTranslation: BibleTranslation
    @Binding var selectedBook: Int
    @Binding var chapter: Int
    
    private let books = BibleBooks.books
    
    let updateInfo: () -> ()
    
    var body: some View {
        HStack{
            
            Picker("Select Translation", selection: $selectedTranslation) {
                ForEach(BibleTranslation.allCases, id: \.self){
                    Text($0.rawValue)
                }
            }.pickerStyle(.menu).colorMultiply(.black)
                .onChange(of: selectedTranslation) { _ in
                    updateInfo()
                }
           
            Spacer()
            
            HStack(spacing:0){
               
                Picker("Select Book", selection: $selectedBook) {
                    ForEach(0..<books.count, id: \.self){
                        
                        Text(books[$0].bookName)
                    }
                }.pickerStyle(.menu).colorMultiply(.black).frame(maxWidth: .infinity)
                    .onChange(of: selectedBook) { _ in
                        chapter = 1
                        updateInfo()
                    }
                
                Picker("Select Chapter", selection: $chapter) {
                    ForEach(1...books[selectedBook].amountOfChapters, id: \.self){
                        Text(String($0))
                    }
                }.pickerStyle(.menu)
                    .onChange(of: chapter) { _ in
                   updateInfo()
                }
            }
        } .frame(maxWidth: .infinity,alignment: .trailing).padding([.trailing,.leading],30)
    }
    
    
}
