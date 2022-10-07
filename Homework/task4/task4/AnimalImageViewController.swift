import UIKit

class AnimalImageViewController: UIViewController {

    var arrayOfAnimals: [String] = ["fox", "deer", "tiger", "raccoon", "frog"]
    @IBOutlet weak var animalImageView: UIImageView!
    

    @IBAction func closeButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpAnimalImageView()
    }
    
    
    
    func setUpAnimalImageView() {
        guard let randomAnimal = arrayOfAnimals.randomElement() else { return }
        animalImageView.image = UIImage(named: randomAnimal)
        animalImageView.layer.cornerRadius = 10
        animalImageView.layer.borderColor = UIColor.black.cgColor
        animalImageView.layer.borderWidth = 1
        
    }
    
    
}
