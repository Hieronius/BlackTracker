import UIKit
import SnapKit

class NumberImageView: UIView {
    
    // MARK: - Properties
    
    private let numberLabel: UILabel = UILabel()
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
    
    func configure(withNumber number: Int, title: String) {
        titleLabel.text = title
        numberLabel.text = "\(number)"
    }
    
    
    // MARK: - Private Methods
    
    private func setupViews() {
        setupNumberLabel()
        setupTitleLabel()
    }
    
    private func setupNumberLabel() {
        numberLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        numberLabel.textColor = .white
        numberLabel.textAlignment = .center
        addSubview(numberLabel)
        numberLabel.snp.makeConstraints { make in
            make.centerX.top.equalToSuperview()
        }
        
        let numberWidth: CGFloat = 55
        numberLabel.backgroundColor = .clear
        numberLabel.textColor = .white
        numberLabel.layer.cornerRadius = numberWidth / 2
        numberLabel.layer.masksToBounds = true
        numberLabel.layer.borderWidth = 1
        numberLabel.layer.borderColor = UIColor.white.cgColor
        
        numberLabel.snp.remakeConstraints { make in
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
            make.top.equalTo(numberLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview()
        }
    }
}
