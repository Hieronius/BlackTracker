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
    var nameLabel: UILabel!
    var nameTextField: UITextField!
    
    // habit image
    var imageStackView: UIStackView!
    var imageLabel: UILabel!
    // imageView may be should be replace with UISegmentedControl
    // small collection view can be implemented
    var imageView: UIImageView!
    
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
    
    // view for skip/froze/edit/streak options
    var optionsStackView: UIStackView!
    
    var streakStackView: UIStackView!
    var streakLabel: UILabel!
    var streakNumber: UILabel!
    
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
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        backgroundColor = AppColors.darkGray
        
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
//        settingsStackView.addArrangedSubview(tagStackView)
//        settingsStackView.addArrangedSubview(reminderStackView)
        
        containerView.addSubview(settingsStackView)
        
        settingsStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-15)
            make.left.equalToSuperview().offset(15)
        }
        
    }
    
    private func setupNameStackView() {
        nameStackView = UIStackView()
        nameStackView.axis = .horizontal
        nameStackView.spacing = 10
        
        nameLabel = UILabel()
        nameLabel.text = "Name"
        
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
        imageLabel.text = "Image"
        
        imageView.image = UIImage(named: "💧")
        
        imageStackView.addArrangedSubview(imageLabel)
        imageStackView.addArrangedSubview(imageView)
        
        settingsStackView.addArrangedSubview(imageStackView)
    }
    
    private func setupFrequencyStackView() {
        frequencyStackView = UIStackView()
        frequencyStackView.axis = .horizontal
        frequencyStackView.spacing = 10
        
        frequencyLabel = UILabel()
        frequencyLabel.text = "Frequency"
        
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
        rateLabel.text = "Rate"
        
        rateSegmentedControl = UISegmentedControl(items: ["Daily", "Weekly", "Monthly"])
        
        rateSegmentedControl.selectedSegmentIndex = 0 // Set initial selection to "Daily"
        rateSegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        
        rateStackView.addArrangedSubview(rateLabel)
        rateStackView.addArrangedSubview(rateSegmentedControl)
        
        settingsStackView.addArrangedSubview(rateStackView)
    }
    
    private func setupCategoryStackView() {
        categoryStackView = UIStackView()
        categoryStackView.axis = .vertical
        categoryStackView.spacing = 10
        
        categoryLabel = UILabel()
        categoryLabel.text = "Category"
        
        categoryTextField = UITextField()
        
        categoryStackView.addArrangedSubview(categoryLabel)
        categoryStackView.addArrangedSubview(categoryTextField)
        
        settingsStackView.addArrangedSubview(categoryStackView)
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
