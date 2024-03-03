import UIKit
import SnapKit

class NumberImageView: UIView {
    
    // MARK: - Properties
    
    private let numberLabel: UILabel = UILabel()
    private let titleLabel: UILabel = UILabel()
    private let imageView: UIImageView = UIImageView()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func configure(withNumber number: Int, title: String, image: UIImage?) {
        numberLabel.text = "\(number)"
        titleLabel.text = title
        imageView.image = image
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        setupNumberLabel()
        setupTitleLabel()
        setupImageView()
    }
    
    private func setupNumberLabel() {
        numberLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        numberLabel.textColor = .white
        numberLabel.textAlignment = .center
        addSubview(numberLabel)
        numberLabel.snp.makeConstraints { make in
            make.centerX.top.equalToSuperview()
        }
    }
    
    private func setupTitleLabel() {
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(numberLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    private func setupImageView() {
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.width.height.equalTo(50) // Adjust size as needed
            make.bottom.equalToSuperview()
        }
    }
}
