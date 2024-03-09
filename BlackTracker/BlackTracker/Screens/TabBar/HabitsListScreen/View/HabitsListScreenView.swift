import UIKit

final class HabitsListScreenView: UIView {
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        backgroundColor = AppColors.darkGray
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // We want to use Collection view because in one cell should be around 10-15 different parameters.
    // 1. Streak
    // 2. Name
    // 3. Time to remind
    // 4. Image
    // 5. Category
    // 6. Progress
    // 7. Day to remind
    // 8. Social value
    // ... other stuff.
}
