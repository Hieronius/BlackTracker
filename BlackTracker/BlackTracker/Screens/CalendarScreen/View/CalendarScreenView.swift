    import UIKit
    import SnapKit

    protocol CalendarScreenViewDelegate: AnyObject {
        func dayTapped() // Update the method name to reflect month selection
    }

    final class CalendarScreenView: UIView {
        
        // MARK: - Public Properties
        
        weak var delegate: CalendarScreenViewDelegate?
        var collectionView: CalendarCollectionView!
        var headerView: CalendarScreenHeaderView!
        var footerView: CalendarScreenFooterView!
        
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
            setupCalendarHeaderView()
            setupCalendarFooterView()
        }
        
        // May be i should create a separate file for it
        private func setupCalendarCollectionView() {
            
            collectionView = CalendarCollectionView()
            
            self.addSubview(collectionView)
            
            collectionView.snp.makeConstraints { make in
                make.leading.equalTo(self.readableContentGuide.snp.leading)
                make.trailing.equalTo(self.readableContentGuide.snp.trailing)
                
                make.centerY.equalTo(self.snp.centerY).offset(10)
                
                make.height.equalTo(self.snp.height).multipliedBy(0.5)
            }
            
        }
        
        private func setupCalendarHeaderView() {
            headerView = CalendarScreenHeaderView()
            
            addSubview(headerView)
            
            headerView.snp.makeConstraints { make in
                make.leading.equalTo(collectionView)
                make.trailing.equalTo(collectionView)
                make.bottom.equalTo(collectionView.snp.top)
                make.height.equalTo(85)
            }
        }
        
        private func setupCalendarFooterView() {
            footerView = CalendarScreenFooterView()
            
            addSubview(footerView)
            
            footerView.snp.makeConstraints { make in
                make.leading.equalTo(collectionView)
                make.trailing.equalTo(collectionView)
                make.top.equalTo(collectionView.snp.bottom)
                make.height.equalTo(60)
            }
        }
    }
