//
//  NetworkManager.swift
//  PersonalBibleApp
//
//  Created by Corey Edh on 2/22/23.
//

import Foundation


struct NetworkManager{
    
    func getData(api: BibleAPIModel) async throws -> ChapterModel{
        
        let request = URLRequest(url: api.url)
        let (data, _) = try await URLSession.shared.data(for: request)
        let chapter = try JSONDecoder().decode(ChapterModel.self, from: data)
        
        return chapter
    }
    
}

