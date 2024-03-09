import UIKit
import SnapKit

class CalendarScreenHeaderView: UIView {
    
    // MARK: - Views
    
    var monthLabel: UILabel!
    var closeButton: UIButton!
    var dayOfWeekStackView: UIStackView!
    var separatorView: UIView!
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale.autoupdatingCurrent
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM y")
        return dateFormatter
    }()
    
    // MARK: - Properties
    
    var baseDate = Date() {
        didSet {
            monthLabel.text = dateFormatter.string(from: baseDate)
        }
    }
    
    var exitButtonTappedCompletionHandler: (() -> Void)
    
    // MARK: - Initialization
    
    init(exitButtonTappedCompletionHandler: @escaping (() -> Void)) {
        self.exitButtonTappedCompletionHandler = exitButtonTappedCompletionHandler
        
        super.init(frame: CGRect.zero)
        
        backgroundColor = .systemGroupedBackground
        
        layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]
        layer.cornerCurve = .continuous
        layer.cornerRadius = 15
        
        setupViews()
        setupConstraints()
        
        closeButton.addTarget(self, action: #selector(didTapExitButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        monthLabel = UILabel()
        monthLabel.font = .systemFont(ofSize: 26, weight: .bold)
        monthLabel.text = "Month"
        monthLabel.accessibilityTraits = .header
        monthLabel.isAccessibilityElement = true
        addSubview(monthLabel)
        
        closeButton = UIButton()
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: "xmark.circle.fill", withConfiguration: configuration)
        closeButton.setImage(image, for: .normal)
        closeButton.tintColor = .secondaryLabel
        closeButton.contentMode = .scaleAspectFill
        closeButton.isUserInteractionEnabled = true
        closeButton.isAccessibilityElement = true
        closeButton.accessibilityLabel = "Close Picker"
        addSubview(closeButton)
        
        dayOfWeekStackView = UIStackView()
        dayOfWeekStackView.distribution = .fillEqually
        addSubview(dayOfWeekStackView)
        
        separatorView = UIView()
        separatorView.backgroundColor = UIColor.label.withAlphaComponent(0.2)
        addSubview(separatorView)
        
        for dayNumber in 1...7 {
            let dayLabel = UILabel()
            dayLabel.font = .systemFont(ofSize: 12, weight: .bold)
            dayLabel.textColor = .secondaryLabel
            dayLabel.textAlignment = .center
            dayLabel.text = dayOfWeekLetter(for: dayNumber)
            dayLabel.isAccessibilityElement = false
            dayOfWeekStackView.addArrangedSubview(dayLabel)
        }
    }
    
    private func setupConstraints() {
        monthLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalTo(closeButton.snp.leading).offset(5)
        }
        
        closeButton.snp.makeConstraints { make in
            make.centerY.equalTo(monthLabel)
            make.height.width.equalTo(28)
            make.trailing.equalToSuperview().offset(-15)
        }
        
        dayOfWeekStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(separatorView.snp.bottom).offset(-5)
        }
        
        separatorView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    // MARK: - Actions
    
    @objc private func didTapExitButton() {
        exitButtonTappedCompletionHandler()
    }
    
    // MARK: - Helper Methods
    
    private func dayOfWeekLetter(for dayNumber: Int) -> String {
        switch dayNumber {
        case 1:
            return "S"
        case 2:
            return "M"
        case 3:
            return "T"
        case 4:
            return "W"
        case 5:
            return "T"
        case 6:
            return "F"
        case 7:
            return "S"
        default:
            return ""
        }
    }
}

