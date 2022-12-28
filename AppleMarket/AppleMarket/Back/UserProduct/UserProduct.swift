import Foundation

struct UserProduct: Identifiable, Codable {
    
    //  Props
    var id: String
    var productName: String // 제품명
    var device: String
    var category: String
    var description: String
    var price: Int
    var images: [String?]
    var count: Int // 재고 수
    
    var storage: [Int] // 용량
    var color: [String?]
    var status: Int // 판매 가능 여부
    var createdAt: Date // 생성 시각
    var series : [String?]
}
