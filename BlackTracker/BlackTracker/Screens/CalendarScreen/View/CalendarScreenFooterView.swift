import UIKit
import SnapKit

protocol CalendarScreenFooterViewDelegate: AnyObject {
    func previousMonthButtonTapped()
    func nextMonthButtonTapped()
}

class CalendarScreenFooterView: UIView {
    
    // MARK: - Public Properties
    
    weak var delegate: CalendarScreenFooterViewDelegate?
    var separatorView: UIView!
    var previousMonthButton: UIButton!
    var nextMonthButton: UIButton!
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    
    private func setupViews() {
        setupFooterView()
        setupSeparatorView()
        setupPreviousMonthButton()
        setupNextMonthButton()
    }
    
    private func setupFooterView() {
        backgroundColor = .systemGroupedBackground

        layer.maskedCorners = [
          .layerMinXMaxYCorner,
          .layerMaxXMaxYCorner
        ]
        layer.cornerCurve = .continuous
        layer.cornerRadius = 15
    }
    
    private func setupSeparatorView() {
        separatorView = UIView()
        separatorView.backgroundColor = UIColor.label.withAlphaComponent(0.2)
        
        addSubview(separatorView)
        
        separatorView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    private func setupPreviousMonthButton() {
        previousMonthButton = UIButton()
        previousMonthButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        previousMonthButton.titleLabel?.textAlignment = .left
        
        if let chevronImage = UIImage(systemName: "chevron.left.circle.fill") {
            let imageAttachment = NSTextAttachment(image: chevronImage)
            let attributedString = NSMutableAttributedString()
            attributedString.append(NSAttributedString(attachment: imageAttachment))
            attributedString.append(NSAttributedString(string: " Previous"))
            previousMonthButton.setAttributedTitle(attributedString, for: .normal)
        } else {
            previousMonthButton.setTitle("Previous", for: .normal)
        }
        
        previousMonthButton.titleLabel?.textColor = .label
        
        addSubview(previousMonthButton)
        
        previousMonthButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        // Action
        previousMonthButton.addTarget(self, action: #selector(didTapPreviousMonthButton), for: .touchUpInside)
    }
    
    private func setupNextMonthButton() {
        nextMonthButton = UIButton()
        nextMonthButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        nextMonthButton.titleLabel?.textAlignment = .right
        
        if let chevronImage = UIImage(systemName: "chevron.right.circle.fill") {
            let imageAttachment = NSTextAttachment(image: chevronImage)
            let attributedString = NSMutableAttributedString(string: "Next ")
            attributedString.append(NSAttributedString(attachment: imageAttachment))
            nextMonthButton.setAttributedTitle(attributedString, for: .normal)
        } else {
            nextMonthButton.setTitle("Next", for: .normal)
        }
        
        nextMonthButton.titleLabel?.textColor = .label
        
        addSubview(nextMonthButton)
        
        nextMonthButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
        
        nextMonthButton.addTarget(self, action: #selector(didTapNextMonthButton), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func didTapPreviousMonthButton() {
        delegate?.previousMonthButtonTapped()
    }
    
    @objc private func didTapNextMonthButton() {
        delegate?.nextMonthButtonTapped()
    }
}

