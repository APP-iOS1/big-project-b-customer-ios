import Foundation

// 기기, 단말기, 액세사리를 칭하는 모든 상품 타입
struct CatalogueProduct: Identifiable, Codable, Hashable {
    
    // MARK: 공통 프로퍼티
    var id: String
    var productName: String // 제품명
    var device: [String] // 기기종류(ex) iPhone, iPad, Mac, 액세서리 등..)
                            // iPhone 액세서리 검색 -> device.contains("iPhone") 메소드 이용해서 iPhone 액세사리 추출
    var category: String // 악세서리(일 경우 해당 단말기명!?)를 위한 변수, 단말기일 경우 단말기명
    var description: String // 간단한 설명글
    var price: Int // 상품 가격. 단말기인 경우, 최저 가격을 입력한다. // iPhone 14 1,000,000원 부터!
    var thumbnailImage: String // 상품 메인 이미지
    var status: Int // 판매 가능 여부
    
    // MARK: iPhone 추가 프로퍼티
    var descriptionImages: [String]? // 상품 설명 사진 혹은 예시 사진
    var model : [String]? // 상품의 버전, 모델 입력란
                            // iPhone 14 Pro Max 액세서리 검색 -> model.contains("iPhone 14 Pro Max") 메소드 이용해서 추출
    var color: [String]? // 색상이 있는 상품만 값 입력
    var storage: [String]? // 상품 용량(단말기인 경우 해당), 해당 안되는 상품은 nil으로 냅둠
    var recommendedProduct: [String]? // 해당 상품의 추천 액세서리
    
    // MARK: iPad 추가 프로퍼티
    var netWork: [String]? // Wi-Fi, Cellular가 들어감
    
    // MARK: MAC 추가 프로퍼티
    var processor: [String]? // 맥북에 들어간 SOC(Processor) 종류가 들어감
    var memory: [String]? // 맥북에 들어간 Memory 종류가 들어감
    
}
