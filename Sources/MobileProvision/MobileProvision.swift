import Foundation

public class MobileProvision {
    public init() {}

    public func parse() throws -> PropertyList? {
        guard let provisionProfile = Bundle.main.path(forResource: "embedded", ofType: "mobileprovision") else {
            return nil
        }
        
        return try parse(with: provisionProfile)
    }
    
    public func parse(with filePath: String) throws -> PropertyList? {
        let fileContents = try String(contentsOfFile: filePath, encoding: .isoLatin1)
        guard let startIndex = fileContents.scanUpTo("<plist") else { return nil }
        guard let endIndex = fileContents.scanUpTo("</plist>") else { return nil }
        
        let from = fileContents.index(startIndex, offsetBy: 0)
        let to = fileContents.index(endIndex, offsetBy: "</plist>".count)
        
        return try processFileContent(String(fileContents[from..<to]))
    }
    
    private func processFileContent(_ body: String) throws -> PropertyList? {        
        guard let bodyData = body.data(using: .isoLatin1) else {
            return nil
        }
        
        return try PropertyListDecoder().decode(PropertyList.self, from: bodyData)
    }
}
