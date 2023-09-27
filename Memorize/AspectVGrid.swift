//
//  AspectVGrid.swift
//  Memorize
//
//  Created by S1OLY on 9/12/23.
//

import SwiftUI

struct AspectVGrid<Item:Identifiable, ItemView : View>: View  {
    var items : [Item]
    var aspectRatio : CGFloat = 1
    var content :  (Item) -> ItemView
    
    init(_ items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body : some View{
        GeometryReader{ geometry in
            let gridItemSize = gridItemWidthThatFits(
                count: items.count,
                size: geometry.size,
                atAspectRatio : aspectRatio
            )
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)], spacing: 0){
                ForEach(items){ item in
                    content(item)
                        .aspectRatio(aspectRatio, contentMode: .fit)

                }
            }
        }
    }
    
    func gridItemWidthThatFits(
        count : Int,
        size : CGSize,
        atAspectRatio aspectRatio : CGFloat
    ) -> CGFloat{
        let count = CGFloat(count)
        var ColumnCount = 1.0
        repeat{
            let width = size.width/ColumnCount
            let height = width/aspectRatio
            
            let rowCount = (count/ColumnCount).rounded(.up)
            if rowCount * height < size.height{
                return (size.width/ColumnCount).rounded(.down)
            }
            ColumnCount += 1
        }while ColumnCount < count
        return min(size.width/count, size.height * aspectRatio).rounded(.down)
    }
}



