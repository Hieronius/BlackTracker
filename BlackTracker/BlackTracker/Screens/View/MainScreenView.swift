import UIKit
import SnapKit

protocol MainScreenViewDelegate: AnyObject {
    func imageViewTapped()
}

final class MainScreenView: UIView {
    
    weak var delegate: MainScreenViewDelegate?
    
    var imageView: UIImageView!
    
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
        imageView = UIImageView()
        
        if let firstImage = ImageService.images.first {
            imageView.image = firstImage
        } else {
            imageView.image = UIImage(named: "tree")!
        }
        
        self.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.top.equalToSuperview().offset(100)
            make.bottom.equalToSuperview().offset(-100)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func imageTapped() {
        delegate?.imageViewTapped()
    }
}
