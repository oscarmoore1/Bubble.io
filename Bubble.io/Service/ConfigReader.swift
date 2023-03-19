//
//  ConfigReader.swift
//  Bubble.io
//
//  Created by Oscar Moore on 15/03/23.
//

import SwiftUI

struct ResponseData: Decodable {
    var bubbles: [BubbleObject]
}
struct BubbleObject: Identifiable, Decodable {
        var id: Int
        var name: String
        var Range: Int
        var Private: Bool
}

func loadJson(filename fileName: String) -> [BubbleObject]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(ResponseData.self, from: data)
            return jsonData.bubbles
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}

