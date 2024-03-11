import UIKit
import SnapKit

final class AddHabitScreenView: UIView {
    
    // should i use Navigation controller in my "add habit screen"???
    
    // MARK: - Public Properties
    
    // view for all UI elements on the screen
    var containerView: UIView!
    var containerStackView: UIStackView!
    
    // MARK: - Settings stack view
    var settingsStackView: UIStackView!
    
    // habit name
    var nameStackView: UIStackView!
    var nameLabel: UILabel!
    var nameTextField: UITextField!
    
    // habit image
    var imageStackView: UIStackView!
    var imageLabel: UILabel!
    // small collection view with emogies can be implemented
    var imageViewLabel: UILabel!
    
    // habit duration in minutes (may be tracking should be implemented later)
    var durationStackView: UIStackView!
    var durationLabel: UILabel!
    var durationTextField: UITextField!
    
    // habit frequency
    var frequencyStackView: UIStackView!
    var frequencyLabel: UILabel!
    var frequencyTextField: UITextField!
    
    // habit category
    var categoryStackView: UIStackView!
    var categoryLabel: UILabel!
    var categoryTextField: UITextField!
    
    // habit tag
    var tagStackView: UIStackView!
    var tagLabel: UILabel!
    var tagTextField: UITextField!
    
    // habit rate (daily, weekly, monthly)
    var rateStackView: UIStackView!
    var rateLabel: UILabel!
    var rateSegmentedControl: UISegmentedControl!
    
    // habit reminder
    var reminderStackView: UIStackView!
    var reminderLabel: UILabel!
    var reminderPicker: UIDatePicker!
    // MARK: End of the settings stack view
    
    var noteFieldView: UITextField!
    
    // MARK: - View for skip/froze/edit/streak options
    var optionsStackView: UIStackView!
    
    var editButton: UIButton!
    var skipButton: UIButton!
    var freezeButton: UIButton!
    
    var streakStackView: UIStackView!
    var streakTitleLabel: UILabel!
    var streakNumberLabel: UILabel!
    // MARK: End of the options block
    
    var completeButton: UIButton!
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        backgroundColor = AppColors.darkGray
        setupContainerStackView()
    }
    
    private func setupContainerStackView() {
        containerStackView = UIStackView()
        containerStackView.axis = .vertical
        containerStackView.spacing = 15
        
        addSubview(containerStackView)
        
        containerStackView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(15)
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(15)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-15)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-15)
        }
        
       setupSettings()
       print("settings added")
       setupNoteField()
       print("note added")
       setupOptions()
       print("options added")
       setupCompleteButton()
       print("button added")
    }
    
    private func setupSettings() {
        settingsStackView = UIStackView()
        settingsStackView.axis = .vertical
        settingsStackView.spacing = 8 // Adjust spacing between elements
        
        setupNameStackView()
        setupImageStackView()
        setupFrequencyStackView()
        setupRateStackView()
        setupCategoryStackView()
        setupTagStackView()
        setupReminderStack()

        containerStackView.addArrangedSubview(settingsStackView)
    }
    
    private func setupNameStackView() {
        nameStackView = UIStackView()
        nameStackView.axis = .horizontal
        nameStackView.spacing = 10
        
        nameLabel = UILabel()
        nameLabel.text = "Name:"
        
        nameTextField = UITextField()
        
        nameStackView.addArrangedSubview(nameLabel)
        nameStackView.addArrangedSubview(nameTextField)
        
        settingsStackView.addArrangedSubview(nameStackView)
    }
    
    private func setupImageStackView() {
        imageStackView = UIStackView()
        imageStackView.axis = .horizontal
        imageStackView.spacing = 10
        
        imageLabel = UILabel()
        imageLabel.text = "Image:"
        
        imageViewLabel = UILabel()
        imageViewLabel.text = "💧"
        
        imageStackView.addArrangedSubview(imageLabel)
        imageStackView.addArrangedSubview(imageViewLabel)
        
        settingsStackView.addArrangedSubview(imageStackView)
    }
    
    private func setupFrequencyStackView() {
        frequencyStackView = UIStackView()
        frequencyStackView.axis = .horizontal
        frequencyStackView.spacing = 10
        
        frequencyLabel = UILabel()
        frequencyLabel.text = "Frequency:"
        
        frequencyTextField = UITextField()
        
        frequencyStackView.addArrangedSubview(frequencyLabel)
        frequencyStackView.addArrangedSubview(frequencyTextField)
        
        settingsStackView.addArrangedSubview(frequencyStackView)
    }
    
    private func setupRateStackView() {
        rateStackView = UIStackView()
        rateStackView.axis = .horizontal
        rateStackView.spacing = 10
        
        rateLabel = UILabel()
        rateLabel.text = "Rate:"
        
        rateSegmentedControl = UISegmentedControl(items: ["Daily", "Weekly", "Monthly"])
        
        rateSegmentedControl.selectedSegmentIndex = 0 // Set initial selection to "Daily"
        rateSegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        
        rateStackView.addArrangedSubview(rateLabel)
        rateStackView.addArrangedSubview(rateSegmentedControl)
        
        settingsStackView.addArrangedSubview(rateStackView)
    }
    
    private func setupCategoryStackView() {
        categoryStackView = UIStackView()
        categoryStackView.axis = .horizontal
        categoryStackView.spacing = 10
        
        categoryLabel = UILabel()
        categoryLabel.text = "Category:"
        
        categoryTextField = UITextField()
        
        categoryStackView.addArrangedSubview(categoryLabel)
        categoryStackView.addArrangedSubview(categoryTextField)
        
        settingsStackView.addArrangedSubview(categoryStackView)
    }
    
    private func setupTagStackView() {
        tagStackView = UIStackView()
        tagStackView.axis = .horizontal
        tagStackView.spacing = 10
        
        tagLabel = UILabel()
        tagLabel.text = "Tag:"
        
        tagTextField = UITextField()
        
        tagStackView.addArrangedSubview(tagLabel)
        tagStackView.addArrangedSubview(tagTextField)
        
        settingsStackView.addArrangedSubview(tagStackView)
    }
    
    private func setupReminderStack() {
        reminderStackView = UIStackView()
        reminderStackView.axis = .horizontal
        reminderStackView.spacing = 10
        
        reminderLabel = UILabel()
        reminderLabel.text = "Reminder:"
        
        reminderPicker = UIDatePicker()
        reminderPicker.datePickerMode = .time
        
        reminderStackView.addArrangedSubview(reminderLabel)
        reminderStackView.addArrangedSubview(reminderPicker)
        
        settingsStackView.addArrangedSubview(reminderStackView)
    }
    
    private func setupNoteField() {
        noteFieldView = UITextField()
        noteFieldView.placeholder = "Note..."
        
        containerStackView.addArrangedSubview(settingsStackView)
    }
    
    private func setupOptions() {
        optionsStackView = UIStackView()
        optionsStackView.axis = .horizontal
        optionsStackView.spacing = 8
        
        setupEditButton()
        setupSkipButton()
        setupFreezeButton()
        setupStreakStackView()
        
        containerStackView.addArrangedSubview(settingsStackView)
    }
    
    private func setupEditButton() {
        editButton = UIButton()
        editButton.setTitle("Edit", for: .normal)
        
        optionsStackView.addArrangedSubview(editButton)
    }
    
    private func setupSkipButton() {
        skipButton = UIButton()
        skipButton.setTitle("Skip", for: .normal)
        
        optionsStackView.addArrangedSubview(skipButton)
    }
    
    private func setupFreezeButton() {
        freezeButton = UIButton()
        freezeButton.setTitle("Freeze", for: .normal)
        
        optionsStackView.addArrangedSubview(freezeButton)
    }
    
    private func setupStreakStackView() {
        streakStackView = UIStackView()
        streakStackView.axis = .horizontal
        streakStackView.spacing = 10
        
        streakTitleLabel = UILabel()
        streakTitleLabel.text = "Streak"
        
        streakNumberLabel = UILabel()
        // just place /(currentStreak)
        streakNumberLabel.text = "0"
        
        optionsStackView.addArrangedSubview(streakStackView)
    }
    
    private func setupCompleteButton() {
        completeButton = UIButton()
        completeButton.setTitle("Complete", for: .normal)
        completeButton.setTitleColor(.white, for: .normal)
        
        completeButton.backgroundColor = .black
        
        completeButton.layer.cornerRadius = 8
        completeButton.layer.masksToBounds = true
        
        containerStackView.addArrangedSubview(settingsStackView)
    }
    
    
    // MARK: - Actions
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("Daily selected")
            // Handle daily selection
        case 1:
            print("Weekly selected")
            // Handle weekly selection
        case 2:
            print("Monthly selected")
            // Handle monthly selection
        default:
            break
        }
    }
}
