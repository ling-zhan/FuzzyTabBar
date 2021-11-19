import SwiftUI

@available(iOS 15.0, *)
public struct FuzzyTabBar: View {
    public var height: CGFloat = 95
    public var action: ((Int) -> Void)?
    public var selectedBarColor: Color
    @Binding var tabbarItems: [TabBarItem]
    @State var selectedTag: Int = 0
    
    public init(action:  ((Int) -> Void)? = nil,
        tabbarItems: Binding<[TabBarItem]>,
         selectedBarColor: Color = .blue) {
        self._tabbarItems = tabbarItems
        self.action = action
        self.selectedBarColor = selectedBarColor
        
        if let bottomPadding = DetectScreenSafeArea.shared.bottomPadding() {
            if bottomPadding == 0 {
                self.height = 85
            }
        }
    }
    
    @Namespace var animation
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.ultraThinMaterial)
                .frame(height: height)
            HStack(spacing: 0) {
                ForEach(tabbarItems, id: \.self) { item in
                    Icon(item: item, selectedTag: $selectedTag, animation: animation, selectedBarColor: selectedBarColor)
                        .frame(width: (UIScreen.main.bounds.width / CGFloat(tabbarItems.count)) - 10)
                        .frame(height: height, alignment: .top)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedTag = item.tag
                                if action != nil {
                                    action!(selectedTag)
                                }
                            }
                        }
                } // end foreach
            }
        } // end body
    } // end body
    
    struct Icon: View {
        public let item: TabBarItem
        @Binding var selectedTag: Int
        public var animation: Namespace.ID
        public var selectedBarColor: Color
        
        var body: some View {
            VStack(spacing: 5) {
                
                if item.tag == selectedTag {
                    RoundedRectangle(cornerRadius: .infinity).frame(width: 40, height: 5)
                        .foregroundColor(selectedBarColor)
                        .padding(.bottom, 15)
                        .matchedGeometryEffect(id: "Move", in: animation)
                }else {
                    RoundedRectangle(cornerRadius: .infinity).frame(width: 20, height: 5)
                        .foregroundColor(.clear)
                        .padding(.bottom, 15)
                }
                
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 10))
                        .foregroundColor(item.isBadge ? .red : .clear)
                        .offset(x: 5, y: -10)
                        .shadow(color: item.isBadge ? .red : .clear, radius: 1)
                        .zIndex(1)
                    VStack {
                        if item.title != nil {
                            Image(item.icon)
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 24, height: 24)
                                .foregroundColor(item.foregroundColor)
                            Text(item.title ?? "")
                                .font(.footnote)
                                .foregroundColor(item.foregroundColor)
                                .padding(.bottom, 8)
                        }else {
                            Image(item.icon)
                                .resizable()
                                .renderingMode(.template)
                                .font(.largeTitle)
                                .frame(width: 30, height: 30)
                                .foregroundColor(item.foregroundColor)
                        }
                        
                    }.zIndex(0)
                }
            }.padding([.bottom, .leading, .trailing], 10)
        } // end body
    } // end Icon View
}
