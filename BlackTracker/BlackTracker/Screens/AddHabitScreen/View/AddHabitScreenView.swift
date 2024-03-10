import UIKit
import SnapKit

final class AddHabitScreenView: UIView {
    
    // should i use Navigation controller in my "add habit screen"???
    
    // MARK: - Public Properties
    
    // view for all UI elements on the screen
    var containerView: UIView!
    
    // view for habit settings
    var settingsStackView: UIStackView!
    
    // habit name
    var nameStackView: UIStackView!
    var nameLabel = "Name"
    var nameTextField: UITextField!
    
    // habit image
    var imageStackView: UIStackView!
    var imageLabel = "Image"
    var imageView: UIImageView!
    
    // habit duration in minutes (may be tracking should be implemented later)
    var durationStackView: UIStackView!
    var durationLabel = "Duration"
    var durationTextField: UITextField!
    
    // habit category
    var categoryStackView: UIStackView!
    var categoryLabel = "Category"
    var categoryTextField: UITextField!
    
    // habit tag
    var tagStackView: UIStackView!
    var tagLabel = "Tag"
    var tagTextField: UITextField!
    
    // habit frequency
    var frequencyStackView: UIStackView!
    var frequencyLabel = "Frequency"
    var frequencyTextField: UITextField!
    
    // habit rate (daily, weekly, monthly)
    var rateStackView: UIStackView!
    var rateLabel = "Rate"
    var rateTextField: UISegmentedControl!
    
    // view for skip/froze/edit/streak options
    var optionsStackView: UIStackView!
    
    var streakStackView: UIStackView!
    var streakLabel = "Streak"
    var streakNumber = "0"
    
    var editButton: UIButton!
    var skipButton: UIButton!
    var frozeButton: UIButton!
    
    // note field
    var noteFieldView: UITextField!
    
    // button to complete the habit
    var completeButton: UIButton!
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        // backgroundColor = AppColors.darkGray
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        setupSettings()
        setupOptions()
        setupNoteField()
        setupCompleteButton
    }
    
    private func setupSettings() {
        settingsStackView = UIStackView()
        
    }
    
    private func setupOptions() {
        
    }
    
    private func setupNoteField() {
        
    }
    
    private func setupCompleteButton() {
        
    }
}