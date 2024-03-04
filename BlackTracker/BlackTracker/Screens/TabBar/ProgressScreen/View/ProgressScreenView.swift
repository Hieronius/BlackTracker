import UIKit
import SnapKit

protocol ProgressScreenViewDelegate: AnyObject {
    func imageViewTapped()
}

final class ProgressScreenView: UIView {
    
    // MARK: - Public Properties
    
    weak var delegate: ProgressScreenViewDelegate?
    var topStackView: UIStackView!
    var progressImageView: UIImageView!
    var bottomStackView: UIStackView!
    
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
        setupTopStackView()
        setupBottomStackView()
        setupProgressImageView()
    }
    
    private func setupTopStackView() {
        topStackView = UIStackView()
        topStackView.axis = .horizontal
        topStackView.alignment = .fill
        topStackView.distribution = .fillEqually
        topStackView.spacing = 10
        
        let dailyVisitsStreakImage = NumberImageView()
        dailyVisitsStreakImage.configure(withNumber: 1, withTitle: "Daily Visits")
        topStackView.addArrangedSubview(dailyVisitsStreakImage)
        
        let dailyProgressStreak = NumberImageView()
        dailyProgressStreak.configure(withNumber: 10, withTitle: "Daily Progress")
        topStackView.addArrangedSubview(dailyProgressStreak)
        
        let rank = NumberImageView()
        rank.configure(withNumber: 100, withTitle: "Rank")
        
        topStackView.addArrangedSubview(rank)
        
        self.addSubview(topStackView)
        
        topStackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(safeAreaLayoutGuide).offset(25)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-25)
            make.height.equalTo(50)
        }
    }
    
    private func setupBottomStackView() {
        bottomStackView = UIStackView()
        bottomStackView.axis = .horizontal
        bottomStackView.alignment = .fill
        bottomStackView.distribution = .fillEqually
        bottomStackView.spacing = 50
        
        let progressPoints = NumberImageView()
        progressPoints.configure(withNumber: 5, withTitle: "Grow Points")
        bottomStackView.addArrangedSubview(progressPoints)
        
        let addHabit = NumberImageView()
        addHabit.configure(withChar: "+", withBackgroundColor: .black)
        bottomStackView.addArrangedSubview(addHabit)
        
        self.addSubview(bottomStackView)
        
        bottomStackView.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide).offset(-68)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(68)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-25)
            make.height.equalTo(50)
        }
        
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
            make.top.equalTo(topStackView.snp.bottom).offset(50)
            make.bottom.equalTo(bottomStackView.snp.top).offset(-25)
            make.leading.equalTo(safeAreaLayoutGuide)
            make.trailing.equalTo(safeAreaLayoutGuide)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        progressImageView.isUserInteractionEnabled = true
        progressImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func imageTapped() {
        delegate?.imageViewTapped()
    }
}
