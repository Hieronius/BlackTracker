import UIKit
import SnapKit

protocol CalendarScreenViewDelegate: AnyObject {
    func dayTapped() // Update the method name to reflect month selection
}

final class CalendarScreenView: UIView {
    
    // MARK: - Public Properties
    
    weak var delegate: CalendarScreenViewDelegate?
    
    // MARK: - Private Properties
    
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        backgroundColor = AppColors.darkGray
    }
}
