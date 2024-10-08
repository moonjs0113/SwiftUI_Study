<h1 align="center">
    KxCoding SwiftUI
</h1>

[![Swift Version][swift-image]](https://swift.org/) 
[![Platform][Platform-image]](https://developer.apple.com/kr/ios/)

[swift-image]: https://img.shields.io/badge/swift-5.5.2-orange.svg?style=flat
[Platform-image]: https://img.shields.io/badge/Platform-ios-lightgray.svg?style=flat

[Mastering SwiftUI](https://www.kxcoding.com/course/mastering-swiftui)
- iOS 15.0+

# Course Keyword
## About SwiftUI
``` Swift
App(protocol), @main, @UIApplicationDelegateAdaptor, .environmentObject
Scene(protocol), @Environment(\.scenePhase)
View(protocol), Modifier 
```
---

## Layouts & Presentations
``` Swift
VStack, HStack, ZStack, LazyHStack, LazyVStack, ScrollView
Group, .overlay, .confirmationDialog, .sheet, .popover
InteractiveDismiss, @Environment(\.dismiss)
```
---

## Text & Font
``` Swift
Text, Label, TextField, SecureField, TextEditor
.environment(\.locale, Locale(identifier: "ko_kr"))
@FocusState
Form, Section,
```
---

## Controls
``` Swift
Link, .environment(\.openURL, OpenURLAction { (URL) -> OpenURLAction.Result })
```
---

## Colors & Images
``` Swift
Color, ShapeStyle.Material
AsyncImage
```
---

## Animation
``` Swift
Animation
```
---

## List
``` Swift
List, ForEach, Section(content, header, footer)
.listRowInsets, .listRowBackground, .toolbar
.onDelete, .onMove
Grid, LazyVGrid, LazyHGrid, GridItem
.refreshable, .swipeActions,  .searchable, .onSubmit
```
---

## DataFlow
``` Swift
@State, @Binding, ObservableObject
@Published, @ObservedObject, @StateObject, @EnvironmentObject
.environmentObject,
```
---

## Gesture
``` Swift
.gesture
TapGesture, .onTapGesture
LongPressGesture, .onLongPressGesture 
Divider, @GestureState
DragGesture, .onDrag
RotationGesture, .rotationEffect,
MagnificationGesture, SequenceGesture,
SimultaneousGesture, ExclusiveGesture
```
---

## Storage
``` Swift
@AppStorage, @SceneStorage
RawRepresentable
NSKeyedUnarchiver.unarchiveTopLevelObjectWithData
NSKeyedUnarchiver.archivedData
```
---
