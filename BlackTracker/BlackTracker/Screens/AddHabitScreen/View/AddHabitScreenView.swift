import UIKit
import SnapKit

final class AddHabitScreenView: UIView {
    
    // MARK: - Public Properties
    
    // view for habit settings
    var settingsStackView: UIStackView!
    
    // view for skip/froze/edit/streak options
    var optionsStackView: UIStackView!
    
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
        
    }
    
    private func setupOptions() {
        
    }
    
    private func setupNoteField() {
        
    }
    
    private func setupCompleteButton() {
        
    }
}
