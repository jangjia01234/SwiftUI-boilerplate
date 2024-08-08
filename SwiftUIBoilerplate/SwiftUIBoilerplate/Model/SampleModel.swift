
import Foundation

struct SampleModel: Identifiable {
    
    let id: String
    let title: String
    let description: String
    let number: Int
    let info: [String]
    let category: Category
    let date: Date
    
    init(
        id: String = UUID().uuidString,
        title: String,
        description: String,
        number: Int,
        info: [String] = [],
        category: Category,
        date: Date
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.number = number
        self.info = info
        self.category = category
        self.date = date
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.number = try container.decode(Int.self, forKey: .number)
        self.info = try container.decodeIfPresent([String].self, forKey: .info) ?? []
        self.category = try container.decode(Category.self, forKey: .category)
        self.date = try container.decode(Date.self, forKey: .date)
    }
    
    func addInfo(_ item: String) -> SampleModel {
        SampleModel(
            id: id,
            title: title,
            description: description,
            number: number,
            info: info + [item],
            category: category,
            date: date
        )
    }
}

extension SampleModel: Equatable, Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
    
}

extension SampleModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case number = "number"
        case info = "info_id"
        case category
        case date = "date"
    }
    
}

extension SampleModel {
    
    enum Category: String, CaseIterable, Codable {
        case meal = "카테고리1"
        case cafe = "카테고리2"
        case alcohol = "카테고리3"
        case sport = "카테고리4"
        case study = "카테고리5"
    }
    
    enum State: String {
        case open = "열림"
        case closed = "닫힘"
    }
    
}
