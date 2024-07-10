import Foundation
import MobileProvision

@Observable
class Store {
    var count: Int = 0
    
    func increment() {
        count += 1
        do {
            if let plist = try MobileProvision().parse() {
                print(plist.appIDName)
                print(plist.name)
                print(plist.teamName)
                print(plist.teamIdentifier)
                print(Calendar.current.numberOfDaysBetween(Date(), and: plist.expirationDate))
            }
        } catch {
            print(error)
        }
    }
}

extension Calendar {
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from)
        let toDate = startOfDay(for: to)
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate)
        
        return numberOfDays.day!
    }
}
