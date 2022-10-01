import UIKit

class ViewController: UIViewController {

    var advertisementLabel: UILabel!
    var titleView: UIView!
    
    var advertisementView: UIView!
    var advertisementMessage: UILabel!
    
    var topView: UIView!
    var bottomView: UIView!
    
    var leftButton: UIButton!
    var rightButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .black
        
//        setUpAdvertisement()
        setUpStartViewsForAnimation()
        setUpStartAnimations()

    }
    
    func setUpStartViewsForAnimation() {
                
        // Top view
        topView = UIView()
        topView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 2)
        topView.backgroundColor = .white
        topView.layer.cornerRadius = 30
        view.addSubview(topView)
        
        // Bottom view
        bottomView = UIView()
        bottomView.frame = CGRect(x: 0, y: topView.bounds.maxY, width: view.bounds.width, height: view.bounds.height / 2)
        bottomView.backgroundColor = .white
        bottomView.layer.cornerRadius = 50
        view.addSubview(bottomView)
        
        // Left button
        leftButton = UIButton()
        leftButton.frame = CGRect(x: view.bounds.maxX + 200, y: view.bounds.maxY - 85, width: 150, height: 60)
        leftButton.setTitle("Skip", for: .normal)
        leftButton.setTitleColor(UIColor.black, for: .normal)
        leftButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
        leftButton.backgroundColor = .systemRed
        leftButton.layer.cornerRadius = 27
        view.addSubview(leftButton)
        leftButton.addTarget(self, action: #selector(skipOrReturn), for: .touchUpInside)
        
        // Right button
        rightButton = UIButton()
        rightButton.frame = CGRect(x: view.bounds.maxX + 250, y: view.bounds.maxY - 85, width: 150, height: 60)
        rightButton.setTitle("Open", for: .normal)
        rightButton.setTitleColor(UIColor.black, for: .normal)
        rightButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
        rightButton.backgroundColor = .systemOrange
        rightButton.layer.cornerRadius = 27
        view.addSubview(rightButton)
        rightButton.addTarget(self, action: #selector(openOrClose), for: .touchUpInside)
        
        // Advertisement view
        advertisementView = UIView()
        advertisementView.backgroundColor = .clear
        advertisementView.layer.borderColor = UIColor.systemYellow.cgColor
        advertisementView.layer.borderWidth = 10
        advertisementView.frame.size.height = 250
        advertisementView.frame.size.width = 350
        advertisementView.layer.cornerRadius = 35
        advertisementView.frame.origin.x = view.center.x + advertisementView.bounds.width
        advertisementView.center.y = view.center.y + 50
        view.addSubview(advertisementView)
        
        // Title view
        titleView = UIView()
        titleView.backgroundColor = .clear
        titleView.layer.borderColor = UIColor.systemPurple.cgColor
        titleView.layer.borderWidth = 10
        titleView.frame.size.height = 100
        titleView.frame.size.width = 350
        titleView.layer.cornerRadius = 35
        titleView.frame.origin.x = view.center.x + titleView.bounds.width
        titleView.center.y = advertisementView.center.y - 200
        view.addSubview(titleView)
        
        // Advertisement label
        advertisementLabel = UILabel()
        titleView.addSubview(advertisementLabel)
        
        advertisementLabel.translatesAutoresizingMaskIntoConstraints = false
        advertisementLabel.topAnchor.constraint(equalTo: titleView.topAnchor, constant: 5).isActive = true
        advertisementLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor, constant: 5).isActive = true
        advertisementLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor, constant: -5).isActive = true
        advertisementLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor, constant: -5).isActive = true
        
        advertisementLabel.textAlignment = .center
        advertisementLabel.numberOfLines = 0
        advertisementLabel.text = "Advertisement"
        advertisementLabel.font = .boldSystemFont(ofSize: 45)
        advertisementLabel.backgroundColor = .clear
        advertisementLabel.textColor = .systemPurple
        
        // Advertisement message
        advertisementMessage = UILabel()
        advertisementView.addSubview(advertisementMessage)
        
        advertisementMessage.translatesAutoresizingMaskIntoConstraints = false
        advertisementMessage.topAnchor.constraint(equalTo: advertisementView.topAnchor, constant: 20).isActive = true
        advertisementMessage.leadingAnchor.constraint(equalTo: advertisementView.leadingAnchor, constant: 20).isActive = true
        advertisementMessage.trailingAnchor.constraint(equalTo: advertisementView.trailingAnchor, constant: -20).isActive = true
        advertisementMessage.bottomAnchor.constraint(equalTo: advertisementView.bottomAnchor, constant: -20).isActive = true

        advertisementMessage.textAlignment = .center
        advertisementMessage.numberOfLines = 0
        advertisementMessage.text = "If you want to see more, click on open"
        advertisementMessage.font = .boldSystemFont(ofSize: 40)
        advertisementMessage.backgroundColor = .clear
        advertisementMessage.textColor = .systemYellow
        
    }
    
    func setUpStartAnimations() {
        // Start views
    

        UIView.animate(withDuration: 0.3) {
            
            // Top and bottom views
            self.topView.backgroundColor = .systemBlue
            self.bottomView.backgroundColor = .systemBlue
            self.topView.frame.origin.y = self.view.bounds.origin.y - self.topView.frame.height + 70
            self.bottomView.frame.origin.y = self.view.bounds.maxY - 110
            
            // Buttons
            self.leftButton.frame.origin.x = self.bottomView.bounds.origin.x + 30
            self.rightButton.frame.origin.x = self.leftButton.bounds.maxX + 65
            
            // Advertisement view
            self.advertisementView.center.x = self.view.center.x
            self.titleView.center.x = self.view.center.x
        }
        
    }
    
    func setUpAnimationForSkip() {
        UIView.animate(withDuration: 0.1) {
            
            self.topView.backgroundColor = .systemRed
            self.advertisementView.layer.borderColor = UIColor.systemRed.cgColor
            self.advertisementView.backgroundColor = .systemRed
            self.advertisementMessage.textColor = .systemRed
            self.titleView.layer.borderColor = UIColor.systemRed.cgColor
            self.titleView.backgroundColor = .systemRed
            self.advertisementLabel.textColor = .systemRed
            self.leftButton.frame.size.width = self.bottomView.bounds.width - 60
            self.rightButton.alpha = 0
            
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.advertisementView.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.origin.y - self.advertisementView.bounds.height - self.topView.bounds.height)
                self.titleView.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.origin.y - self.titleView.bounds.height - self.topView.bounds.height)
                self.leftButton.frame.size.width = self.bottomView.bounds.width - 60
                self.rightButton.alpha = 0
            } completion: { _ in
                UIView.animate(withDuration: 0.1) {
                    self.topView.backgroundColor = .systemBlue
                    
                }
            }
        }
    }
    
    func setUpAnimationForReturn() {
        
        UIView.animate(withDuration: 0.1) {
            self.topView.backgroundColor = .systemGreen
            self.advertisementView.layer.borderColor = UIColor.systemGreen.cgColor
            self.advertisementView.backgroundColor = .systemGreen
            self.advertisementMessage.textColor = .systemGreen
            self.titleView.layer.borderColor = UIColor.systemGreen.cgColor
            self.titleView.backgroundColor = .systemGreen
            self.advertisementLabel.textColor = .systemGreen
            
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.advertisementView.transform = .identity
                self.titleView.transform = .identity
                self.leftButton.frame.size.width = self.rightButton.bounds.width
                self.rightButton.alpha = 1
          
            } completion: { _ in
                UIView.animate(withDuration: 0.1) {
                    self.topView.backgroundColor = .systemBlue
                    self.advertisementView.layer.borderColor = UIColor.systemYellow.cgColor
                    self.advertisementView.backgroundColor = .clear
                    self.advertisementMessage.textColor = .systemYellow
                    self.titleView.layer.borderColor = UIColor.systemPurple.cgColor
                    self.titleView.backgroundColor = .clear
                    self.advertisementLabel.textColor = .systemPurple
                }
            }
        }
    }
    
    func setUpAnimationForOpen() {
        
        UIView.animate(withDuration: 0.3) {
            
            self.titleView.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.origin.y - self.advertisementView.bounds.height - self.topView.bounds.height)
            self.topView.backgroundColor = .systemPurple
            self.advertisementView.backgroundColor = .systemYellow
            self.titleView.backgroundColor = .systemPurple
            self.rightButton.frame.origin.x = self.bottomView.bounds.origin.x + 30
            self.rightButton.frame.size.width = self.bottomView.bounds.width - 60
            self.leftButton.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.titleView.transform = CGAffineTransform(translationX: 0, y: self.advertisementMessage.bounds.origin.y + 25)
                self.advertisementMessage.alpha = 0
                self.advertisementLabel.alpha = 0

            } completion: { _ in
                UIView.animate(withDuration: 0.1) {
                   
                    self.advertisementView.backgroundColor = .systemPurple
                    self.advertisementView.layer.borderColor = UIColor.systemPurple.cgColor
                    
                    self.titleView.backgroundColor = .systemYellow
                    self.titleView.layer.borderColor = UIColor.systemYellow.cgColor
                } completion: { _ in
                    UIView.animate(withDuration: 0.3) {
                        self.titleView.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.origin.y - self.advertisementView.bounds.height - self.topView.bounds.height)
                        self.topView.backgroundColor = .systemYellow
                        self.advertisementView.frame.size.height = 600
                        self.advertisementView.center.y = self.view.center.y - 20
                        self.advertisementMessage.text = "Description"
                        self.advertisementView.backgroundColor = .systemPurple
                        self.advertisementView.layer.borderColor = UIColor.systemPurple.cgColor
                        self.advertisementMessage.textColor = .systemPurple
                    } completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.advertisementView.backgroundColor = .clear
                            self.advertisementMessage.alpha = 1
                            self.advertisementMessage.font = .boldSystemFont(ofSize: 50)
                        }
                    }
                }
            }
        }

        
    }
    
    func setUpAnimationForClose() {
        
        UIView.animate(withDuration: 0.1) {
            self.advertisementView.backgroundColor = .systemPurple
            self.advertisementMessage.alpha = 0
            self.advertisementLabel.alpha = 0
            self.rightButton.frame.origin.x = self.leftButton.bounds.maxX + 65
            self.rightButton.frame.size.width = self.leftButton.bounds.width
            self.leftButton.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.advertisementView.frame.size.height = 250
                self.advertisementView.center.y = self.view.center.y + 50
                self.advertisementMessage.text = "If you want to see more info, click on 'open'"
            } completion: { _ in
                UIView.animate(withDuration: 0.1) {
                    self.advertisementMessage.font = .boldSystemFont(ofSize: 40)
                } completion: { _ in
                    UIView.animate(withDuration: 0.3) {
                        self.titleView.backgroundColor = .systemYellow
                        self.titleView.layer.borderColor = UIColor.systemYellow.cgColor
                        self.advertisementLabel.textColor = .systemYellow
                        self.topView.backgroundColor = .systemBlue
                        self.titleView.transform = CGAffineTransform(translationX: 0, y: self.advertisementMessage.bounds.origin.y + 25)
                    } completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.titleView.backgroundColor = .systemPurple
                            self.titleView.layer.borderColor = UIColor.systemPurple.cgColor
                            self.advertisementLabel.textColor = .systemPurple
                            self.advertisementView.backgroundColor = .systemYellow
                            self.advertisementView.layer.borderColor = UIColor.systemYellow.cgColor
                            self.advertisementMessage.textColor = .systemYellow
                        } completion: { _ in
                            UIView.animate(withDuration: 0.2) {
                                self.titleView.transform = .identity
                                self.advertisementLabel.alpha = 1
                                self.advertisementMessage.alpha = 1
                            } completion: { _ in
                                UIView.animate(withDuration: 0.1) {
                                    self.titleView.backgroundColor = .clear
                                    self.advertisementView.backgroundColor = .clear
                                }
                            }

                        }

                    }
                }
            }
        }
    }
    
    @objc func skipOrReturn() {
        if leftButton.titleLabel?.text == "Skip" {
            setUpAnimationForSkip()
            leftButton.setTitle("Return", for: .normal)
            leftButton.backgroundColor = .systemGreen
        } else {
            setUpAnimationForReturn()
            leftButton.setTitle("Skip", for: .normal)
            leftButton.backgroundColor = .systemRed
        }
        
    }
    
    @objc func openOrClose() {
        if rightButton.titleLabel?.text == "Open" {
            setUpAnimationForOpen()
            rightButton.setTitle("Close", for: .normal)
            rightButton.backgroundColor = .systemPurple
        } else {
            setUpAnimationForClose()
            rightButton.setTitle("Open", for: .normal)
            rightButton.backgroundColor = .systemOrange
        }
    }

}

