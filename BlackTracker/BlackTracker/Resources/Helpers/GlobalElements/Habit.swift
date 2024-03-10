// MARK: List of properties to add:
// 1. Name
// 2. Streak
// 3. Image for habit label
// 4. Category
// 5. Tag
// 6. Color
// 7. Times per day
// 8. Frequency (dayly/weekly/monthly)
// 9. Reminder
// 10. Social value
// 11. Duration
// 12. Complete button
// 13. Edit button
// 14. Froze habit
// 15. Skip habit
// 16. Note

struct Habit {
    var image = 0 // image
    var name = "habit"
    var streak = 5 // don't need to be in "add habit"
    var frequency = "daily" // may be DatePicker or Date
    var category = "fitness"
    var tag = "important"
    var color = "color" // UIColor
    var timesPerDay = 5
    var reminder = "yes" // Date()
    var socialValue = 10
    var duration = 15 // in min or in sec
    var note = ""
    
}
