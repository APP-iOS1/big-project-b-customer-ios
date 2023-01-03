//
//  SnapScrollingHstack.swift
//  AppleMarket
//
//  Created by Martin on 2023/01/03.
//


import SwiftUI

struct SnapScrollingHStack: ViewModifier {
    
    @State private var scrollOffset: CGFloat
    @State private var dragOffset: CGFloat
    @State private var index: Int = 0
    
    
    var items: Int
    var itemWidth: CGFloat
    var itemSpacing: CGFloat
    private var initialOffset: CGFloat
    
    init(items: Int, itemWidth: CGFloat, itemSpacing: CGFloat) {
        self.items = items
        self.itemWidth = itemWidth
        self.itemSpacing = itemSpacing
        
       
        
        let screenWidth = UIScreen.main.bounds.width
        
        // Set Initial Offset to first Item
        // 카드 양 옆쪽 여백을 처음 오프셋으로 설정
        initialOffset = (screenWidth - itemWidth) / 2.0
        
        self._scrollOffset = State(initialValue: 0)
        self._dragOffset = State(initialValue: 0)
    }
     
    
    func body(content: Content) -> some View {
        content
            .offset(x: initialOffset + scrollOffset + dragOffset, y: 0)
            .gesture(DragGesture()
                .onChanged({ event in
                    dragOffset = event.translation.width
                })
                .onEnded({ event in
                    // 드래그 한대로 스크롤 되게 함
                    scrollOffset += event.translation.width
                    dragOffset = 0
                    
                    // 오프셋이 음수면 왼쪽으로 드래그 한것이고 다음 카드가 나와야하므로 인덱스가 증가해야함
                    if event.translation.width < 0 {
                        index += 1
                    } else {
                        index -= 1
                    }
                    
                    index = min(index, items - 1)
                    index = max(index, 0)
                    
                    
                    let newOffset: CGFloat = -CGFloat(index) * (itemWidth + itemSpacing)
                    
                    
                    // Animate snapping
                    withAnimation {
                        scrollOffset = newOffset
                    }
                    
                })
            )
    }
}

//사용 예 MainProductDetailView에 있음
extension View {
    func snapScrolling(itemCount: Int, itemWidth: CGFloat, spacing: CGFloat) -> some View {
        modifier(SnapScrollingHStack(items: itemCount, itemWidth: itemWidth, itemSpacing: spacing))
    }
}
