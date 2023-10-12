import Foundation
import MobileProvision
import ArgumentParser

@main
struct MobileProvisionCommand: ParsableCommand {
    @Flag var verbose = false
    @Flag var all = false
    @Option var format: String = "markdown"
    @Argument var filePath: [String]
    
    mutating func run() throws {
        do {
            try parseFile()
        } catch {
            print(error)
        }
    }
    
    private func parseFile() throws {
        let mpf = MobileProvision()
        print("|AppName|Provision Profile|Expiration Date|")
        print("|-------|-----------------|---------------|")
        for case let p in filePath {
            guard let result = try mpf.parse(with: p) else {
                return
            }
            
            let delta = Calendar.current.numberOfDaysBetween(Date(), and: result.expirationDate)
            if all || delta < 90 {
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
                print("|\(result.appIDName)|\(result.name)|\(dateFormatter.string(from: result.expirationDate))|")
            }
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
