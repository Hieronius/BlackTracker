import UIKit
import SnapKit

final class MainScreenView: UIView {
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        setupImageView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupImageView() {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tree")
        
        self.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.top.equalToSuperview().offset(100)
            make.bottom.equalToSuperview().offset(-100)
        }
    }
}
