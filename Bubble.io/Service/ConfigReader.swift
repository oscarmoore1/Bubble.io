// Import the SwiftUI library to use SwiftUI-specific functionality
import SwiftUI

// Define a struct 'ResponseData' conforming to 'Decodable' protocol
// This will model the top-level data we expect to receive
struct ResponseData: Decodable {
    // Define a property 'bubbles' as an array of 'BubbleObject'
    var bubbles: [BubbleObject]
}

// Define a struct 'BubbleObject' conforming to 'Identifiable' and 'Decodable' protocols
// 'Identifiable' will help SwiftUI differentiate between each BubbleObject when rendering
// 'Decodable' will allow us to decode BubbleObject instances from JSON
struct BubbleObject: Identifiable, Decodable {
    // Define the properties we expect each 'BubbleObject' to have
    var id: Int
    var name: String
    var Range: Int
    var Private: Bool
}

// Define a function 'loadJson' which takes a filename and returns an optional array of 'BubbleObject'
func loadJson(filename fileName: String) -> [BubbleObject]? {
    // Attempt to get the URL for the given filename in the app's main bundle
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            // Attempt to load the data at the URL
            let data = try Data(contentsOf: url)
            // Create an instance of JSONDecoder, which can decode JSON data into Swift types
            let decoder = JSONDecoder()
            // Attempt to decode the data into an instance of 'ResponseData'
            let jsonData = try decoder.decode(ResponseData.self, from: data)
            // Return the 'bubbles' array from the 'ResponseData'
            return jsonData.bubbles
        } catch {
            // If there was an error in any of the above steps, print the error
            print("error:\(error)")
        }
    }
    // If the URL couldn't be found, or if there was an error loading or decoding the data, return nil
    return nil
}
