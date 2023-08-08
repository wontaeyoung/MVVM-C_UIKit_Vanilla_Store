import UIKit

final class SearchBookViewController: BaseViewController {

    // MARK: - Stored Property
    private let searchBookViewModel: SearchBookViewModel
    private let bookListViewController: BookListViewController
    private var searchGuideText: UILabel = {
        let label: UILabel = .init()
        label.text = "찾고싶은 책의 이름을 검색해주세요!"
        label.textColor = .black
        
        return label
    }()
    
    // MARK: - Initializer
    init(
        searchBookViewModel: SearchBookViewModel,
        bookListViewController: BookListViewController
    ) {
        self.searchBookViewModel = searchBookViewModel
        self.bookListViewController = bookListViewController
        
        super.init()
    }
    
    // MARK: - Method
    override func setAttribute() {
        navigationItem.searchController = {
            let searchController: UISearchController = .init(searchResultsController: bookListViewController)
            let searchBar: UISearchBar = searchController.searchBar
            
            searchBar.placeholder = "Search Books"
            
            return searchController
        }()
    }
    
    override func setHierarchy() {
        view.addSubview(searchGuideText)
    }
    
    override func setConstraint() {
        searchGuideText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchGuideText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchGuideText.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
