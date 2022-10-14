import UIKit

class RegistrationViewController: UIViewController {
    
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    
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
        setUpConstraints()
    }
    
    func setUpConstraints() {
        
        //MARK: - titleLabel Constraints
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        //MARK: - loginLabel Constraints
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        loginLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
        loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        
        loginLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //MARK: - loginTextField Constraints
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        
        loginTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: loginLabel.trailingAnchor, constant: 30).isActive = true
        loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        loginTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //MARK: - passwordLabel Constraints
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        passwordLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 30).isActive = true
        passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        
        passwordLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //MARK: - passwordTextField Constraints
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 30).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.trailingAnchor, constant: 30).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //MARK: - signInButton Constraints
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        signInButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        signInButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
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


