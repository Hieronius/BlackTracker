import UIKit

final class CalendarScreenView: UIView {
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        backgroundColor = AppColors.darkGray
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        
    }
}
