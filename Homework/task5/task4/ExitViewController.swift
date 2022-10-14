import UIKit

class ExitViewController: UIViewController {
    
    @IBAction func signOutButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
        resetCount()
    }
    
    @IBOutlet weak var helloLoginLabel: UILabel!
    @IBOutlet weak var signOutButton: UIButton!
    
    let login: String = UserModel.login
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpTitle()
        
        setUpConstraints()
    }
    
    func setUpTitle() {
        helloLoginLabel.text = "Hello, \(login)"
    }
    
    func resetCount() {
        CountModel.count = 0
    }
    
    func setUpConstraints() {
        
        //MARK: - helloLoginLabel Constraints
        helloLoginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        helloLoginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        helloLoginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        helloLoginLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        //MARK: - signOutButton Constraints
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
                
        signOutButton.topAnchor.constraint(equalTo: helloLoginLabel.bottomAnchor, constant: 30).isActive = true
        signOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width / 2 - signOutButton.bounds.width / 2).isActive = true
        signOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: signOutButton.bounds.width / 2 - view.bounds.width / 2).isActive = true
        
        signOutButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        signOutButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
}
