//
//  Weather.swift
//  Weather
//
//  Created by Ivan Zakharov on 3/9/21.
//

import Foundation

final class MeaningsModel: Decodable {
    var id: Int?
    var text: String?
    var meanings: [Meaning?]
}

final class Meaning: Decodable {
    var id: Int?
    var partOfSpeechCode: String?
    var translation: Translation?
    var previewUrl: String?
    var imageUrl: String?
    var transcription: String?
    var soundUrl: String?
}

final class Translation: Decodable {
    var text: String?
    var note: String?
}
