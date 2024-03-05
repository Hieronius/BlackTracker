import UIKit
import SnapKit

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
        // setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        let calendarView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        addSubview(calendarView)
        calendarView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
