import Foundation

extension String {
    func scanUpTo(_ string: String) -> String.Index? {
        guard let index = self.range(of: string)?.lowerBound else {
            return nil
        }
        
        return index
    }
}

