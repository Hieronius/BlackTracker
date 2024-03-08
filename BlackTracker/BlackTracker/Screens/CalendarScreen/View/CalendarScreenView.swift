import UIKit
import SnapKit

protocol CalendarScreenViewDelegate: AnyObject {
    func dayTapped() // Update the method name to reflect month selection
}

final class CalendarScreenView: UIView {
    
    // MARK: - Public Properties
    
    weak var delegate: CalendarScreenViewDelegate?
    var calendarCollectionView: UICollectionView!
    
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
        setupCalendarCollectionView()
    }
    
    private func setupCalendarCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        calendarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        calendarCollectionView.isScrollEnabled = false
        
        calendarCollectionView.backgroundColor = .lightGray
        
        self.addSubview(calendarCollectionView)
        
        calendarCollectionView.snp.makeConstraints { make in
            make.leading.equalTo(self.readableContentGuide.snp.leading)
            make.trailing.equalTo(self.readableContentGuide.snp.trailing)
            
            make.centerY.equalTo(self.snp.centerY).offset(10)
            
            make.height.equalTo(self.snp.height).multipliedBy(0.5)
        }
    }
}
