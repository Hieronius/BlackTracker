import UIKit

final class AchievementScreenView: UIView {
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        backgroundColor = AppColors.darkGray
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
