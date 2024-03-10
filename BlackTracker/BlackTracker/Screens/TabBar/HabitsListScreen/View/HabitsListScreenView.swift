import UIKit

final class HabitsListScreenView: UIView {
    
    // MARK: - Public Properties
    
    // On the top of the screen probably should be filter system
    
    var headerView
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        // backgroundColor = AppColors.darkGray
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
