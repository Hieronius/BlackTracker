import UIKit
import SnapKit

class NumberImageView: UIView {
    
    // MARK: - Properties
    
    private let contentLabel: UILabel = UILabel()
    private let titleLabel: UILabel = UILabel()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func configure(withNumber number: Int? = nil,
                   withChar char: Character? = nil,
                   withTitle title: String? = nil,
                   withBackgroundColor backgroundColor: UIColor? = nil) {
        
        if let number = number {
            contentLabel.text = "\(number)"
        } else if let char = char {
            contentLabel.text = "\(char)"
        } else {
            contentLabel.text = nil
        }
        
        if let title = title {
            titleLabel.text = title
        }
        
        if let backgroundColor = backgroundColor {
            contentLabel.backgroundColor = backgroundColor
        }
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        setupNumberLabel()
        setupTitleLabel()
    }
    
    private func setupNumberLabel() {
        contentLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        contentLabel.textColor = .white
        contentLabel.textAlignment = .center
        addSubview(contentLabel)
        contentLabel.snp.makeConstraints { make in
            make.centerX.top.equalToSuperview()
        }
        
        let numberWidth: CGFloat = 55
        contentLabel.backgroundColor = .clear
        contentLabel.textColor = .white
        contentLabel.layer.cornerRadius = numberWidth / 2
        contentLabel.layer.masksToBounds = true
        contentLabel.layer.borderWidth = 1
        contentLabel.layer.borderColor = UIColor.white.cgColor
        
        contentLabel.snp.remakeConstraints { make in
            make.width.equalTo(numberWidth)
            make.height.equalTo(numberWidth)
            make.centerX.top.equalToSuperview()
        }
    }
    
    private func setupTitleLabel() {
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        titleLabel.textColor = .gray
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview()
        }
    }
}
