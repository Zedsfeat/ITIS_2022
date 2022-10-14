import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var browseCatalogButton: UIButton!
    @IBOutlet weak var animalImagesButton: UIButton!
    
    
    @IBAction func browseCatalogButtonAction(_ sender: UIButton) {
        CountModel.count += 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpConstraints()
    }
    
    func setUpConstraints() {
        
        //MARK: - browseCatalogButton Constraints
        browseCatalogButton.translatesAutoresizingMaskIntoConstraints = false
        browseCatalogButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        browseCatalogButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        browseCatalogButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        browseCatalogButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        //MARK: - animalImagesButton Constraints
        animalImagesButton.translatesAutoresizingMaskIntoConstraints = false
        animalImagesButton.topAnchor.constraint(equalTo: browseCatalogButton.bottomAnchor, constant: 30).isActive = true
        animalImagesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        animalImagesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        animalImagesButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
}
