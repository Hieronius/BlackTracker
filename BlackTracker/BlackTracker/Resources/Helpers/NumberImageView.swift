import UIKit

class NumberImageView: UIImageView {
    
    // MARK: - Private Properties
    
    private var number: Int = 0 {
        didSet {
            updateImage()
        }
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateImage()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateImage()
    }
    
    // MARK: - Public Methods
    
    func setNumber(_ number: Int) {
        self.number = number
    }
    
    // MARK: - Private Methods
    
    private func updateImage() {
        // Convert the number into an image
        guard let image = numberToImage(number: number) else {
            return
        }
        
        // Update the image view's image
        self.image = image
    }
    
    private func numberToImage(number: Int) -> UIImage? {
        // Convert the number into an image
        let numberString = "\(number)"
        let imageSize = CGSize(width: 20, height: 20) // Adjust size as needed
        let renderer = UIGraphicsImageRenderer(size: imageSize)
        
        let image = renderer.image { context in
            // Draw the number as text in the center of the image
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 16), // Adjust font size as needed
                .paragraphStyle: paragraphStyle,
                .foregroundColor: UIColor.black // Adjust text color as needed
            ]
            
            let textRect = CGRect(origin: .zero, size: imageSize)
            numberString.draw(with: textRect, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        }
        
        return image
    }
}
