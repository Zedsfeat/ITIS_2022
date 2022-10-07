import Foundation


struct UserModel {
    
    private enum Key: String {
        case loginKey
    }
    
    static var login: String! {
        get {
            return UserDefaults.standard.string(forKey: Key.loginKey.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = Key.loginKey.rawValue
            if let newLogin = newValue {
                defaults.set(newLogin, forKey: key)
            }
            else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}
