//
//  ArticleResponse.swift
//  SpaceFlightDemo
//
//  Created by Indo Teknologi Utama on 28/09/24.
//

import Foundation

// MARK: - ArticleResponse
struct SpaceFlightResponse: Codable {
    let count: Int
    var results: [ArticleInfo]
}

// MARK: - Result
struct ArticleInfo: Codable {
    let id: Int
    let title: String
    let url: String
    let imageURL: String
    let newsSite, summary: String
    let publishedAt: String
    let updatedAt: String
    let featured: Bool?
    let launches: [Launch]?
    let events: [Event]?

    enum CodingKeys: String, CodingKey {
        case id, title, url
        case imageURL = "image_url"
        case newsSite = "news_site"
        case summary
        case publishedAt = "published_at"
        case updatedAt = "updated_at"
        case featured, launches, events
    }
}

// MARK: - Event
struct Event: Codable {
    let eventID: Int
    let provider: String

    enum CodingKeys: String, CodingKey {
        case eventID = "event_id"
        case provider
    }
}

// MARK: - Launch
struct Launch: Codable {
    let launchID, provider: String

    enum CodingKeys: String, CodingKey {
        case launchID = "launch_id"
        case provider
    }
}
