import UIKit

class RegistrationViewController: UIViewController {
    
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func signInButtonAction(_ sender: UIButton) {
        if alertRegistration() {
            saveLoginToUserDefaults()
            presentTabBarController()
            clearTextFields()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpTextFields()
    }
    
    func presentTabBarController() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func setUpTextFields() {
        passwordTextField.isSecureTextEntry = true
        
    }
    
    func clearTextFields() {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    func alertRegistration() -> Bool {
        if loginTextField.text!.isEmpty && passwordTextField.text!.isEmpty {
            let alert = UIAlertController(title: "Input error", message: "You didn't fill in the fields \nLOGIN and PASSWORD", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
            return false
        } else if passwordTextField.text!.isEmpty {
            let alert = UIAlertController(title: "Input error", message: "You didn't fill in the field PASSWORD", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
            return false
        } else if loginTextField.text!.isEmpty {
            let alert = UIAlertController(title: "Input error", message: "You didn't fill in the field LOGIN", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
            return false
        }
        return true
    }
    
    func saveLoginToUserDefaults() {
        UserModel.login = loginTextField.text
    }
}


