import UIKit

class AnimalImageViewController: UIViewController {

    var arrayOfAnimals: [String] = ["fox", "deer", "tiger", "raccoon", "frog"]
    
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalImageLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    @IBAction func closeButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpAnimalImageView()
        
        setUpConstraints()
    }
    
    func setUpConstraints() {

        //MARK: - animalImageLabel Constraints
        animalImageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        animalImageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        animalImageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true

        animalImageLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //MARK: - closeButton Constraints
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: animalImageLabel.trailingAnchor, constant: 30).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
        //MARK: - animalImageView Constraints
        animalImageView.translatesAutoresizingMaskIntoConstraints = false
        
        animalImageView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 30).isActive = true
        animalImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        animalImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        animalImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        
    }
    
    func setUpAnimalImageView() {
        guard let randomAnimal = arrayOfAnimals.randomElement() else { return }
        animalImageView.image = UIImage(named: randomAnimal)
        animalImageView.layer.cornerRadius = 10
        animalImageView.layer.borderColor = UIColor.black.cgColor
        animalImageView.layer.borderWidth = 1
        
    }
    
    
}
