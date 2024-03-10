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
    var nameLabel = "Name:"
    var nameTextField: UITextField!
    
    // habit image
    var imageStackView: UIStackView!
    var imageLabel = "Image:"
    var imageView: UIImageView!
    
    // habit duration in minutes (may be tracking should be implemented later)
    var durationStackView: UIStackView!
    var durationLabel = "Duration:"
    var durationTextField: UITextField!
    
    // habit frequency
    var frequencyStackView: UIStackView!
    var frequencyLabel = "Frequency:"
    var frequencyTextField: UITextField!
    
    // habit reminder
    var reminderStackView: UIStackView!
    var reminderLabel = "Reminder:"
    var reminderPicker: UIDatePicker!
    
    // habit category
    var categoryStackView: UIStackView!
    var categoryLabel = "Category:"
    var categoryTextField: UITextField!
    
    // habit tag
    var tagStackView: UIStackView!
    var tagLabel = "Tag:"
    var tagTextField: UITextField!
    
    // habit rate (daily, weekly, monthly)
    var rateStackView: UIStackView!
    var rateLabel = "Rate:"
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
        setupContainerView()
    }
    
    private func setupContainerView() {
        containerView = UIView()
        
        addSubview(containerView)
        
        // add constraints accordingly to AddHabitView
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        setupSettings()
        setupOptions()
        setupNoteField()
        setupCompleteButton()
    }
    
    private func setupSettings() {
        settingsStackView = UIStackView()
        
        // Configure stack view
        settingsStackView.axis = .vertical
        settingsStackView.spacing = 8 // Adjust spacing between elements
        
        settingsStackView.addArrangedSubview(nameStackView)
        settingsStackView.addArrangedSubview(imageStackView)
        settingsStackView.addArrangedSubview(frequencyStackView)
        settingsStackView.addArrangedSubview(rateStackView)
        settingsStackView.addArrangedSubview(categoryStackView)
        settingsStackView.addArrangedSubview(tagStackView)
        settingsStackView.addArrangedSubview(reminderStackView)
        
        containerView.addSubview(settingsStackView)
        
        settingsStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-15)
            make.left.equalToSuperview().offset(15)
        }
        
    }
    
    private func setupNameStackView() {
        
        // add elements to name stack
        
    }
    
    private func setupImageStackView() {
        
        // add elements to image stack
    }
    
    private func setupFrequencyStackView() {
        
        // add elements to frequency stack
    }
    
    private func setupRateStackView() {
        
        // add elements to rate stack
    }
    
    private func setupCategoryStackView() {
        
        // add elements to category stack
    }
    
    private func setupTagStackView() {
        
        // add elements to tag stack
    }
    
    private func setupReminderStack() {
        
        // add elements to reminder stack
    }
    
    private func setupOptions() {
        
        // add editStack
        // add frozeStack
        // add skipStack
        // add streakStack
        
        // add options to container view
        
        // add constraints to right of settings / top-right of container view
        
    }
    
    private func setupEditStackView() {
        
        // add elements to edit stack
    }
    
    private func setupFrozeStack() {
        
        // add elements to frozeStack
    }
    
    private func setupNoteField() {
        
        // add to container view
        
        // add constraints to settings
        
    }
    
    private func setupCompleteButton() {
        
        // add to container view
        
        // add constraints to note
    }
}
