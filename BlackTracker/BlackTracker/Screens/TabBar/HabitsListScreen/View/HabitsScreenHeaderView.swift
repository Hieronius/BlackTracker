import UIKit
import SnapKit

class HabitsScreenHeaderView: UIView {
    
    // MARK: - Private Properties
    
    private var filterView: UISegmentedControl!
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        filterView = UISegmentedControl()
    }
}
