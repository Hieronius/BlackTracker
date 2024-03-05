import UIKit
import SnapKit
import CalendarKit

protocol CalendarScreenViewDelegate: AnyObject {
    func dayTapped()
}

final class CalendarScreenView: UIView {
    
    // MARK: - Public Properties
    
    weak var delegate: CalendarScreenViewDelegate?
    
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
