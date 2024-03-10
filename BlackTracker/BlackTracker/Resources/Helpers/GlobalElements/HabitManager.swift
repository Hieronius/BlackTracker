import Foundation

class HabitManager {
    
    // MARK: - Public Properties
    
    static let shared = HabitManager()
    
    static var habitStorage = [Habit]()
    
    // MARK: - Initialization
    
    private init() {}
    
}
