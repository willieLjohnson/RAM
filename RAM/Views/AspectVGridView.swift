//
//  AspectVGridView.swift
//  RAM
//
//  Created by Willie Liwa Johnson on 10/1/22.
//

import SwiftUI

// VGridView that adjusts the size of its items based on the give aspect ratio.
struct AspectVGridView<Item, ItemView>: View where Item: Identifiable, ItemView: View {
  let items: [Item]
  let aspectRatio: CGFloat
  let content: (Item) -> ItemView

  init(items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
    self.items = items
    self.aspectRatio = aspectRatio
    self.content = content
  }

  var body: some View {
    GeometryReader { geometry in
      VStack {
        let width: CGFloat = widthThatFits(itemCount: items.count, in: geometry.size,
                                           itemAspectRatio: aspectRatio)

        LazyVGrid(columns: [adaptiveGridItem(width: width)], spacing: 0) {
          ForEach(items) { item in
            content(item).aspectRatio(aspectRatio, contentMode: .fit)
          }
        }

        Spacer(minLength: 0)
      }
    }
  }
}

private extension AspectVGridView {
  // Create an adaptive grid item.
  private func adaptiveGridItem(width: CGFloat) -> GridItem {
    var gridItem = GridItem(.adaptive(minimum: width))
    gridItem.spacing = 0
    return gridItem
  }

  // Calculate the best width to fit all the items.
  private func widthThatFits(itemCount: Int, in size: CGSize, itemAspectRatio: CGFloat) -> CGFloat {
    var columnCount = 1
    var rowCount = itemCount

    repeat {
      let itemWidth = size.width / CGFloat(columnCount)
      let itemHeight = itemWidth / itemAspectRatio
      if CGFloat(rowCount) * itemHeight < size.height {
        break
      }

      columnCount += 1
      rowCount = (itemCount + (columnCount - 1)) / columnCount
    } while columnCount < itemCount

    if columnCount > itemCount {
      columnCount = itemCount
    }

    return floor(size.width / CGFloat(columnCount))
  }
}
