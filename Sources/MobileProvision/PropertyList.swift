import Foundation

public struct PropertyList: Decodable {
    public let appIDName: String
    public let expirationDate: Date
    public let teamName: String
    public let teamIdentifier: [String]
    public let provisionedDevices: [String]?
    public let name: String
        
    enum CodingKeys: String, CodingKey {
        case appIDName = "AppIDName"
        case expirationDate = "ExpirationDate"
        case teamName = "TeamName"
        case provisionedDevices = "ProvisionedDevices"
        case name = "Name"
        case teamIdentifier = "TeamIdentifier"
    }
}
