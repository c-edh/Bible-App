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
    @AppStorage("page") var chapter: Int = 1
    @State var translation: BibleAPI.BibleTranslation = .kjv
    //Cherokee Breaks Program
    
    //  @State var selection: BooksInBible = .Genesis
    @State var selection = ["Hi","test"]
    @State var verseNumber = 1
    @State var bionicReading: Bool = false
    
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    //
                } label: {
                    Text(translation.rawValue).foregroundColor(.black)
                }.buttonStyle(.bordered)
                Spacer()
                HStack{
                    Button {
                        //
                    } label: {
                        Text((viewModel.chapter?.chapter ?? "")).foregroundColor(.black)
                    }.buttonStyle(.bordered)
                    
                    Text(": " + String(verseNumber))
                    
                }
            } .frame(maxWidth: .infinity,alignment: .trailing).padding([.trailing,.leading],30)
            
            ScrollView{
                
                if viewModel.chapter != nil{
                    ForEach((viewModel.chapter?.verses)!, id: \.self) { verse in
                        
                        
                        
                        if bionicReading{
                            let wordsInVerse = verse.text?.components(separatedBy: " ")
                            
                            wordsInVerse?.reduce(Text("").font(.system(size:20)).fontWeight(.heavy),
                                                 {
                                
                                let (firstHalf, secondHalf) = splitString($1)
                                
                                return $0 + Text(String(firstHalf)).font(.system(size: 20,weight: .semibold)) + Text(String(secondHalf) + "   ").font(.system(size:20, weight: .light))
                            })
                            
                        }else{
                            HStack{
                                Text(String(verse.verse ?? 0))
                                    .frame(maxHeight: .infinity, alignment: .top)
                                Text((verse.text ?? ""))
                                
                            }
                        }
                        
                    }.padding([.trailing,.leading])
                    
                }
            }.padding(.top)
            
            
            HStack{
                Button {
                    chapter -= 1
                    
                    Task{
                        await viewModel.getChapter(bookName: "JHN", chapterNumber: chapter, bibleTrasnaltion: translation)
                    }
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
                    
                    Task{
                        await viewModel.getChapter(bookName: "JHN", chapterNumber: chapter, bibleTrasnaltion: translation)
                    }
                } label: {
                    Image(systemName: "arrowshape.right.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                        .shadow(radius: 6)
                }
                
                
            }.padding([.leading,.trailing], 50)
            
        }.task {
            await viewModel.getChapter(bookName: "JHN", chapterNumber: chapter, bibleTrasnaltion: translation)
        }
    }
    //
    //    private func applyAttributes(verse: String) -> Text {
    //        return Text(verse).font(.system(size: CGFloat(Int.random(in: 19..<30))))
    //    }
    
    private func splitString(_ word: String) -> (Substring, Substring){
        let halfLength = word.count / 2 + 1
        let firstHalf = word[0..<halfLength]
        let secondHalf = word[halfLength..<word.count]
        return (firstHalf, secondHalf)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: BibleViewModelMock())
        
    }
}

extension StringProtocol {
    subscript(bounds: CountableClosedRange<Int>) -> SubSequence {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(start, offsetBy: bounds.count)
        return self[start..<end]
    }
    
    subscript(bounds: CountableRange<Int>) -> SubSequence {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(start, offsetBy: bounds.count)
        return self[start..<end]
    }
}