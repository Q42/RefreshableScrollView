# RefreshableScrollView

In SwiftUI, it is currently only possible to use pull to refresh on `List` views. This package provides a custom scroll view that is refreshable, so that you can pull to refresh any SwiftUI view you desire. 
It responds to the `.refreshable()` modifier, so you use it in the exact same way as you would refresh a List.

It also supports passing in a custom `UIRefreshControl`, so that you may have loaders with a custom look.

![demo](https://user-images.githubusercontent.com/477710/170267593-7026758f-99c6-4175-87b2-ea03acd3ff9b.gif)

## How does it work?

This view works by wrapping `UIScrollView` internally and putting your SwiftUI view in a UIHostingController within the scroll view.

## Examples

A full sample project with various refreshable views is available at: https://github.com/Q42/RefreshableScrollViewDemo

### Basic example

```swift
struct CustomView: View {
  var body: some View {
    RefreshableScrollView {
      Text("Hello, World!")
    }
    .refreshable {
      do {
        // Sleep for 2 seconds
        try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
      } catch {}
    }
  }
}
```

### Lazy VStack

```swift
struct StackView: View {
  struct Item: Identifiable {
    let id: Int
  }
  @State var items: [Item] = Array(1...100).map(Item.init)
  @State var count = 100

  var body: some View {
    RefreshableScrollView {
      LazyVStack(alignment: .leading) {
        ForEach(items) { item in
          Text("Row \(item.id)")
        }
      }
    }
    .refreshable {
      do {
        // Sleep for 2 seconds
        try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
      } catch {}
      
      count += 1
      items.insert(Item(id: count), at: 0)
    }
  }
}
```

### Lazy VGrid

```swift
struct GridView: View {
  let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

  var body: some View {
    RefreshableScrollView {
      LazyVGrid(columns: columns) {
        ForEach((0...79), id: \.self) {
          let codepoint = $0 + 0x1f600
          let codepointString = String(format: "%02X", codepoint)
          Text("\(codepointString)")
          let emoji = String(Character(UnicodeScalar(codepoint)!))
          Text("\(emoji)")
        }
      }.font(.largeTitle)
    }
    .refreshable {
      do {
        // Sleep for 2 seconds
        try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
      } catch {}
    }
  }
}
```
