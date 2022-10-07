import UIKit

class ExitViewController: UIViewController {
    
    @IBAction func signOutButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
        resetCount()
    }
    @IBOutlet weak var helloLoginLabel: UILabel!

    let login: String = UserModel.login
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpTitle()
    }
    
    func setUpTitle() {
        helloLoginLabel.text = "Hello, \(login)"
    }
    
    func resetCount() {
        CountModel.count = 0
    }
    
}
