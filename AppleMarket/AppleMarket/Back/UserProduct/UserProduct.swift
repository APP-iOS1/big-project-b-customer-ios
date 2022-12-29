import Foundation

struct UserProduct: Identifiable, Codable {
    
    //  Props
    var id: String
    var productName: String // 제품명
    var device: String // 기기종류(ex) iPhone, iPad, Mac, 액세서리 등..)
    var category: String // 악세서리(일 경우 해당 단말기명!?)를 위한 변수, 단말기일 경우 단말기명 / maindetail 하단 리스트명
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
