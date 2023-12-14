import UIKit
import CoreData

@objc(BookMemo)
final class MyBookDTO: NSManagedObject {
    @NSManaged var id: UUID
    @NSManaged var isbn13: String
    @NSManaged var title: String
    @NSManaged var author: String
    @NSManaged var cover: String
    @NSManaged var score: Int
    @NSManaged var memo: String
    @NSManaged var state: String
    
    func asModel(with coverImage: UIImage) -> MyBook {
        guard let state = MyBook.ReadState(rawValue: state) else {
            return .dummy
        }
        
        return .init(
            id: id,
            isbn13: isbn13,
            title: title,
            author: author,
            cover: coverImage,
            score: MyBook.starScore(rawValue: score) ?? .noScore,
            memo: memo,
            state: state)
    }
    
    func changePropertiesWith(_ another: MyBookDTO) {
        self.id = another.id
        self.isbn13 = another.isbn13
        self.memo = another.memo
        self.state = another.state
    }
}