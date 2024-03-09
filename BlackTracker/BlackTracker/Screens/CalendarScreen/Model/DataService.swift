import Foundation

class DateService {
    static let shared = DateService()
    
    private init() {}
    
    let calendar = Calendar(identifier: .gregorian)
    
    // Additional methods related to date operations can go here
}
