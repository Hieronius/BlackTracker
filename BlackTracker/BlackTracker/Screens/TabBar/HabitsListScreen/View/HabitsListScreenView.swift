import UIKit

final class HabitsListScreenView: UIView {
    
    // MARK: - Public Properties
    
    // var headerView = UISegmentedControl or custom dropdown menu view
    // var collectionView: HabitsCollectionView!
    // var footerView = bottom stackView from ProgressBar
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        // backgroundColor = AppColors.darkGray
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
