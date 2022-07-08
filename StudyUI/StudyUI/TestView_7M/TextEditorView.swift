//
//  TextEditorView.swift
//  StudyUI
//
//  Created by Moon Jongseek on 2022/07/06.
//

import SwiftUI

struct TextEditorView: View {
    
    
    var body: some View {
        Form {
            Section {
                Text("예를 들어")
            }
            
            TEView()
        }
    }
}

struct TEView: View {
    @AppStorage("TEXT_EDITOR") private var text = ""
    var body: some View{
        TextEditor(text: $text)
    }
}


struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView()
    }
}
