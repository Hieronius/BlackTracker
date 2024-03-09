import UIKit

final class CalendarScreenViewController: GenericViewController<CalendarScreenView> {
    
    // MARK: - Private Properties
    
    private let selectedDate: Date? = nil
    private lazy var days = generateDaysInMonth(for: baseDate)
    private let selectedDateChanged: ((Date) -> Void)? = nil
    private var dateFormatter: DateFormatter!
    private let dateService = DateService.shared
    private var numberOfWeeksInBaseDate = 0
    
    private var baseDate: Date = Date() {
      didSet {
        updateNumberOfWeeks()
      }
    }
    
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let currentDate = Date()
//        let components = dateService.calendar.dateComponents([.year, .month, .day], from: currentDate)
//        print(components)
//
        updateNumberOfWeeks()
        
        rootView.delegate = self
        rootView.headerView.delegate = self
        rootView.footerView.delegate = self
        setupDayFormatter()
        
        // Assign data source and delegate
        rootView.calendarCollectionView.dataSource = self
        rootView.calendarCollectionView.delegate = self
        
        // Set base date for header view
        rootView.headerView.baseDate = baseDate
        
    }
    
    // MARK: - Private Methods
    
    private func setupDayFormatter() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
    }
    
    private func updateNumberOfWeeks() {
        let calendar = dateService.calendar
        numberOfWeeksInBaseDate = calendar.range(of: .weekOfMonth, in: .month, for: baseDate)?.count ?? 0
    }
}

// MARK: - Day Generation
private extension CalendarScreenViewController {
    
    // Get actual data for month
    func monthMetadata(for baseDate: Date) throws -> MonthMetadata {
        guard let numberOfDaysInMonth = dateService.calendar.range(
            of: .day,
            in: .month,
            for: baseDate)?.count,
              let firstDayOfMonth = dateService.calendar.date(
                from: dateService.calendar.dateComponents([.year, .month], from: baseDate)
              )
        else {
            throw CalendarDataError.metadataGeneration
        }
        
        let firstDayWeekday = dateService.calendar.component(.weekday, from: firstDayOfMonth)
        
        return MonthMetadata(
            numberOfDays: numberOfDaysInMonth,
            firstDay: firstDayOfMonth,
            firstDayWeekday: firstDayWeekday
        )
    }
    
    func generateDaysInMonth(for baseDate: Date) -> [Day] {
        guard let metadata = try? monthMetadata(for: baseDate) else {
            fatalError("An error occurred when generating the metadata for \(baseDate)")
        }
        
        let numberOfDaysInMonth = metadata.numberOfDays
        let offsetInInitialRow = metadata.firstDayWeekday
        let firstDayOfMonth = metadata.firstDay
        
        // code to avoid gaps in a month's first row
        var days: [Day] = (1..<(numberOfDaysInMonth + offsetInInitialRow)).map { day in
                let isWithinDisplayedMonth = day >= offsetInInitialRow
                let dayOffset =
                isWithinDisplayedMonth ?
                day - offsetInInitialRow :
                -(offsetInInitialRow - day)
                
                return generateDay(
                    offsetBy: dayOffset,
                    for: firstDayOfMonth,
                    isWithinDisplayedMonth: isWithinDisplayedMonth
                )
            }
        days += generateStartOfNextMonth(using: firstDayOfMonth)
        
        return days
    }
    
    func generateDay(
        offsetBy dayOffset: Int,
        for baseDate: Date,
        isWithinDisplayedMonth: Bool
    ) -> Day {
        let date = dateService.calendar.date(
            byAdding: .day,
            value: dayOffset,
            to: baseDate)
        ?? baseDate
        
        // An error here
        return Day(
            date: date,
            number: dateFormatter.string(from: date),
            isSelected: dateService.calendar.isDate(date, inSameDayAs: selectedDate ?? Date()),
            isWithinDisplayedMonth: isWithinDisplayedMonth
        )
    }
    
    func generateStartOfNextMonth(
        using firstDayOfDisplayedMonth: Date
    ) -> [Day] {
        guard
            let lastDayInMonth = dateService.calendar.date(
                byAdding: DateComponents(month: 1, day: -1),
                to: firstDayOfDisplayedMonth
            )
        else {
            return []
        }
        
        let additionalDays = 7 - dateService.calendar.component(.weekday, from: lastDayInMonth)
        guard additionalDays > 0 else {
            return []
        }
        
        let days: [Day] = (1...additionalDays)
            .map {
                generateDay(
                    offsetBy: $0,
                    for: lastDayInMonth,
                    isWithinDisplayedMonth: false)
            }
        
        return days
    }

    
    enum CalendarDataError: Error {
        case metadataGeneration
    }
}

// MARK: - CalendarScreenViewDelegate

extension CalendarScreenViewController: CalendarScreenViewDelegate {
    func dayTapped() {
        print("calendar day tapped. reaction from CalendarScreenViewController")
    }
}

// MARK: - CalendarScreenHeaderViewDelegate

extension CalendarScreenViewController: CalendarScreenHeaderViewDelegate {
    func closeButtonTapped() {

        dismiss(animated: true)
        print("close button tapped. Reaction from Controller")
    }
}

// MARK: - CalendarScreenFooterViewDelegate

extension CalendarScreenViewController: CalendarScreenFooterViewDelegate {
    
    func previousMonthButtonTapped() {
        baseDate = dateService.calendar.date(
          byAdding: .month,
          value: -1,
          to: baseDate
          ) ?? baseDate
    }
    
    func nextMonthButtonTapped() {
        baseDate = dateService.calendar.date(
          byAdding: .month,
          value: 1,
          to: baseDate
          ) ?? baseDate
    }
}

// MARK: - UICollectionViewDataSource
extension CalendarScreenViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        days.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let day = days[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CalendarDateCollectionViewCell.reuseIdentifier,
            for: indexPath) as! CalendarDateCollectionViewCell

        
        cell.day = day
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CalendarScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let day = days[indexPath.row]
        if let selectedDateChanged = selectedDateChanged {
            selectedDateChanged(day.date)
        } else {
            // it's nil, fix it
            print("selectedDateChanged is nil")
        }
        dismiss(animated: true, completion: nil)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = Int(collectionView.frame.width / 7)
        let height = Int(collectionView.frame.height) / numberOfWeeksInBaseDate
        return CGSize(width: width, height: height)
    }
}
