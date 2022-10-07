import UIKit

class BrowseCatalogViewController: UIViewController {

    
    @IBOutlet weak var catalogPageLabel: UILabel!

    let count: Int = CountModel.count
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpCatalogPageLabel()
    }
    
    func setUpCatalogPageLabel() {
        catalogPageLabel.text = "Catalog, Page {\(count)}"
    }

}
