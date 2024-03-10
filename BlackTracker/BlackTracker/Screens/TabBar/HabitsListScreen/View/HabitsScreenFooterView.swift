import UIKit
import SnapKit

class HabitsScreenFooterView: UIView {
    
    // MARK: - Private Properties
    private var stackView: UIStackView!
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 50
        
        let progressPoints = CustomRoundImageView()
        progressPoints.configure(withNumber: 5, withTitle: "Grow Points")
        stackView.addArrangedSubview(progressPoints)
        
        let addHabit = CustomRoundImageView()
        addHabit.configure(withChar: "+", withBackgroundColor: AppColors.veryDarkGray)
        stackView.addArrangedSubview(addHabit)
        
        self.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide).offset(-68)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(68)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-30)
            make.height.equalTo(50)
        }
    }
}
