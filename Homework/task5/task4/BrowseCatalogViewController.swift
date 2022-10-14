import UIKit

class BrowseCatalogViewController: UIViewController {

    
    @IBOutlet weak var catalogPageLabel: UILabel!

    let count: Int = CountModel.count
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpCatalogPageLabel()
        
        setUpConstraints()
    }
    
    func setUpCatalogPageLabel() {
        catalogPageLabel.text = "Catalog, Page {\(count)}"
    }
    
    func setUpConstraints() {
        
        //MARK: - catalogPageLabel Constraints
        catalogPageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        catalogPageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        catalogPageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        catalogPageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
    }

}
