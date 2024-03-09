import UIKit
import SnapKit

protocol CalendarScreenViewDelegate: AnyObject {
    func dayTapped() // Update the method name to reflect month selection
}

final class CalendarScreenView: UIView {
    
    // MARK: - Public Properties
    
    weak var delegate: CalendarScreenViewDelegate?
    var calendarCollectionView: UICollectionView!
    var headerView: CalendarScreenHeaderView!
    var footerView: CalendarScreenFooterView!
    
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
        
        // MARK: I should make constraints for collection view -> HeaderView -> FooterView
        backgroundColor = AppColors.darkGray
        
        setupCalendarCollectionView()
        setupCalendarHeaderView()
        setupCalendarFooterView()
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
        
        calendarCollectionView.register(
          CalendarDateCollectionViewCell.self,
          forCellWithReuseIdentifier: CalendarDateCollectionViewCell.reuseIdentifier
        )
    }
    
    private func setupCalendarHeaderView() {
        headerView = CalendarScreenHeaderView()
        
        addSubview(headerView)
        
        headerView.snp.makeConstraints { make in
            make.leading.equalTo(calendarCollectionView)
            make.trailing.equalTo(calendarCollectionView)
            make.bottom.equalTo(calendarCollectionView.snp.top)
            make.height.equalTo(85)
        }
    }
    
    private func setupCalendarFooterView() {
        footerView = CalendarScreenFooterView()
        
        addSubview(footerView)
        
        footerView.snp.makeConstraints { make in
            make.leading.equalTo(calendarCollectionView)
            make.trailing.equalTo(calendarCollectionView)
            make.top.equalTo(calendarCollectionView.snp.bottom)
            make.height.equalTo(60)
        }
    }
}
