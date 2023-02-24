//
//  Picker.swift
//  PersonalBibleApp
//
//  Created by Corey Edh on 2/24/23.
//

import SwiftUI

struct PickerView: View {
    
    @State var selectedTranslation: BibleTranslation = .kjv
    
    private let chooseFrom: [BibleTranslation] = BibleTranslation.allCases
    
    var body: some View {
        VStack{
            Picker("Select Translation", selection: $selectedTranslation) {
                ForEach(BibleTranslation.allCases, id: \.self){
                    Text($0.rawValue)
                }
            }.pickerStyle(.navigationLink)
            Spacer()

        }
    }
}

struct Picker_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
