import UIKit
import SnapKit

protocol ProgressScreenViewDelegate: AnyObject {
    func imageViewTapped()
}

final class ProgressScreenView: UIView {
    
    // MARK: - Public Properties
    
    weak var delegate: ProgressScreenViewDelegate?
    var progressImageView: UIImageView!
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        backgroundColor = AppColors.darkGray
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    // Zoom Animation
    func animateImageTransition(to newImage: UIImage) {
        UIView.transition(with: self.progressImageView,
                          duration: 0.2,
                          options: .transitionCrossDissolve,
                          animations: {
            self.progressImageView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            self.progressImageView.image = newImage
            self.progressImageView.transform = .identity
        },
                          completion: nil)
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        // setupTopStackView
        // setupBottomStackView
        setupProgressImageView()
    }
    
    private func setupTopStackView() {
        // setup dailyStreakImageView
        // setup progressStreakImageView
        // setup rankingStreakImageView
    }
    
    private func setupBottomStackView() {
        // setup progressPointsImageView
        // setup addHabitButton
    }
    
    private func setupProgressImageView() {
        progressImageView = UIImageView()
        
        if let firstImage = ImageService.images.first {
            progressImageView.image = firstImage
        } else {
            progressImageView.image = UIImage(named: "tree")!
        }
        
        self.addSubview(progressImageView)
        
        progressImageView.snp.makeConstraints { make in
             make.edges.equalTo(safeAreaLayoutGuide)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        progressImageView.isUserInteractionEnabled = true
        progressImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func imageTapped() {
        delegate?.imageViewTapped()
    }
}
