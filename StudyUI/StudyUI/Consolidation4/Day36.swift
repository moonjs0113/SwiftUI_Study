//
//  Day36.swift
//  StudyUI
//
//  Created by 문종식 on 2022/03/07.
//

import SwiftUI

struct User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct Day36: View {
    @State private var user = User()
    var body: some View {
        VStack {
            Text("Your name is \(self.user.firstName) \(self.user.lastName)")
            TextField("First name", text: self.$user.firstName)
            TextField("Last name", text: self.$user.lastName)
        }
    }
}

struct Day36_Previews: PreviewProvider {
    static var previews: some View {
        Day36()
    }
}
