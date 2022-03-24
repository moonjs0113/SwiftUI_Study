//
//  Day54.swift
//  StudyUI
//
//  Created by Moon Jongseek on 2022/03/25.
//

import SwiftUI
import CoreData

struct Day54: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        Form {
            List {
                ForEach(self.books) { book in
                    NavigationLink {
                        Text(book.title ?? "Unknown Title")
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Bookworm")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    self.showingAddScreen.toggle()
                } label: {
                    Label("Add Book", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: self.$showingAddScreen) {
            AddBookView()
        }
    }
}

struct EmojiRatingView: View {
    let rating: Int16
    var body: some View {
        switch self.rating {
        case 1:
            Text("1")
        case 2:
            Text("2")
        case 3:
            Text("3")
        case 4:
            Text("4")
        default:
            Text("5")
        }
    }
}

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    func image(for number: Int) -> Image {
        return number > self.rating ? self.offImage ?? self.onImage : self.onImage
//        if number > self.rating {
//            return self.offImage ?? self.onImage
//        } else {
//            return self.onImage
//        }
    }
    
    var body: some View {
        HStack {
            if self.label.isEmpty == false {
                Text(self.label)
            }
            
            ForEach(1..<self.maximumRating + 1, id: \.self) { number in
                self.image(for: number)
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                    .onTapGesture {
                        self.rating = number
                    }
            }
        }
    }
}

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    @Environment(\.dismiss) var dismiss
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        Form {
            Section {
                TextField("Name of book", text: self.$title)
                TextField("Author's name", text: self.$author)
                
                Picker("Genre", selection: self.$genre) {
                    ForEach(self.genres, id: \.self) { genre in
                        Text(genre)
                    }
                }
            }
            
            Section {
                TextEditor(text: self.$review)
                RatingView(rating: self.$rating)
//                Picker("Rating", selection: self.$rating) {
//                    ForEach(0..<6) { rating in
//                        Text(String(rating))
//                    }
//                }
            } header: {
                Text("Write a review")
            }
            
            Section {
                Button("Save") {
                    let newBook = Book(context: moc)
                    newBook.id = UUID()
                    newBook.title = self.title
                    newBook.author = self.author
                    newBook.rating = Int16(self.rating)
                    newBook.genre = self.genre
                    newBook.review = self.review
                    
                    try? moc.save()
                }
            }
        }
        .navigationTitle("Add Book")
    }
}

struct Day54_Previews: PreviewProvider {
    static var previews: some View {
        Day54()
    }
}
