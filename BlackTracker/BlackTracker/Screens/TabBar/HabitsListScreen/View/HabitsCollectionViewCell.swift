import UIKit

class HabitsCollectionViewCell: UICollectionViewCell {
    
    // MARK: List of properties to add:
    // 1. Name
    // 2. Streak
    // 3. Image for habit label
    // 4. Category
    // 5. Tag
    // 6. Color
    // 7. Times per day
    // 8. Frequency (dayly/weekly/monthly)
    // 9. Reminder
    // 10. Social value
    // 11. Duration
    // 12. Complete button
    // 13. Edit button
    // 14. Froze habit
    // 15. Skip habit
    // 16. Note
    
    // MARK: - Public Properties
    
    /// Reuse identifier for the cell.
    static let reuseIdentifier = String(describing: CalendarCollectionViewCell.self)
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        
    }
}
