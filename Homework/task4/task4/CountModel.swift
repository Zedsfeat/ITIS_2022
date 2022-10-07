import Foundation

struct CountModel {
    
    private enum Key: String {
        case countKey
    }
    
    static var count: Int! {
        get {
            return UserDefaults.standard.integer(forKey: Key.countKey.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = Key.countKey.rawValue
            if let newCount = newValue {
                defaults.set(newCount, forKey: key)
            }
            else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}
