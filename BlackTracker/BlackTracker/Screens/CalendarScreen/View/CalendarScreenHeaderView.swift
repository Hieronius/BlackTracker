import UIKit
import SnapKit

protocol CalendarScreenHeaderViewDelegate: AnyObject {
    func closeButtonTapped()
}

class CalendarScreenHeaderView: UIView {
    
    // MARK: - Public Properties
    
    weak var delegate: CalendarScreenHeaderViewDelegate?
    var monthLabel: UILabel!
    var closeButton: UIButton!
    var dayOfWeekStackView: UIStackView!
    var separatorView: UIView!
    
    /// Base date used for displaying month information.
    var baseDate = Date() {
        didSet {
            monthLabel.text = dateFormatter.string(from: baseDate)
        }
    }
    
    
    /// Date formatter for formatting date information.
    private var dateFormatter: DateFormatter!
    
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: CGRect.zero)
        
        setupViews()
        setupDateFormatter()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        setupHeaderView()
        setupHeaderConstraints()
    }
    
    private func setupHeaderView() {
        backgroundColor = .systemGray6
        
        // Set the masked corners of the layer to the top-left and top-right corners to create rounded corners.
        layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]
        
        // Set the corner curve to continuous to make the corners smooth.
        layer.cornerCurve = .continuous
        
        layer.cornerRadius = 15
        
        setupMonthLabel()
        setupCloseButton()
        setupDayOfWeekStackView()
        setupSeparatorView()
        
    }
    
    private func setupMonthLabel() {
        monthLabel = UILabel()
        monthLabel.font = .systemFont(ofSize: 26, weight: .bold)
        monthLabel.text = "Month"
        monthLabel.accessibilityTraits = .header
        monthLabel.isAccessibilityElement = true
        
        addSubview(monthLabel)
    }
    
    private func setupCloseButton() {
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
        
        closeButton.addTarget(self, action: #selector(didTapExitButton), for: .touchUpInside)
    }
    
    private func setupDayOfWeekStackView() {
        dayOfWeekStackView = UIStackView()
        dayOfWeekStackView.distribution = .fillEqually
        addSubview(dayOfWeekStackView)
        
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
    
    private func setupSeparatorView() {
        separatorView = UIView()
        separatorView.backgroundColor = UIColor.label.withAlphaComponent(0.2)
        
        addSubview(separatorView)
    }
    
    private func setupDateFormatter() {
        dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale.autoupdatingCurrent
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM y")
    }
    
    private func setupHeaderConstraints() {
        // if we want to use constraints from element like monthLabel and closeButton, we first should initialize these elements and after add constraints to it at the same moment
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
        delegate?.closeButtonTapped()
    }
    
    // MARK: - Helper Methods
    
    /// Returns the abbreviated letter representation for the day of the week.
    /// - Parameter dayNumber: The numerical representation of the day of the week (1-7).
    /// - Returns: Abbreviated letter representation of the day of the week.
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
