//
//  MockData.swift
//  tuun
//
//  Created by Cole Uyematsu on 10/19/25.
//

import Foundation

struct MockData {
    static let sampleUser = User(
        id: "1",
        username: "USERNAME",
        followerCount: 67,
        followingCount: 0,
        reviewCount: 15
    )
    
    static let sampleSongs: [Song] = [
        Song(id: "1", title: "See you again (feat. Kali Uchis)", artist: "Tyler, The Creator, Kali Uchis", albumCoverURL: "flower_boy"),
        Song(id: "2", title: "untitled 08 | 09.06.2014.", artist: "Kendrick Lamar", albumCoverURL: "untitled_unmastered"),
        Song(id: "3", title: "Runaway", artist: "Kanye West and Pusha T", albumCoverURL: "mbdtf"),
        Song(id: "4", title: "New Person, Same Old Mistakes", artist: "Tame Impala", albumCoverURL: "currents"),
        Song(id: "5", title: "One Dance", artist: "Drake, Wizkid, Kyla", albumCoverURL: "views"),
        Song(id: "6", title: "Out of Time", artist: "The Weeknd", albumCoverURL: "out_of_time"),
        Song(id: "7", title: "Smooth Operator", artist: "Sade", albumCoverURL: "smooth_operator"),
        Song(id: "8", title: "Goodbye Yellow Brick Road", artist: "Elton John", albumCoverURL: "yellow_brick_road"),
        Song(id: "9", title: "Every Little Thing She Does is Magic", artist: "The Police", albumCoverURL: "police"),
        Song(id: "10", title: "Needed Me", artist: "Rihanna", albumCoverURL: "red"),
        Song(id: "11", title: "She's Always a Woman", artist: "Billy Joel", albumCoverURL: "joel"),
        Song(id: "12", title: "Saving All My Love For you", artist: "Whitney Houston", albumCoverURL: "saving_my_love"),
        Song(id: "13", title: "Tuyo", artist: "Nico Play", albumCoverURL: "tuyo"),
        Song(id: "14", title: "Session 32", artist: "Summer Walker", albumCoverURL: "session32"),
        Song(id: "15", title: "The Great Gig in the Sky", artist: "Pink Floyd", albumCoverURL: "pink_floyd")
    ]
    
    static let sampleReviews: [Review] = [
        Review(
            userID: sampleUser.id,
            song: sampleSongs[0],
            rating: 10.0,
            comment: "I really enjoyed this song, thought it was perfect from start to finish. Can't think of one that is better!",
            dateRated: createDate(month: 9, day: 21, year: 2025),
            ranking: 1
        ),
        Review(
            userID: sampleUser.id,
            song: sampleSongs[1],
            rating: 9.7,
            comment: "Good story",
            dateRated: createDate(month: 8, day: 21, year: 2023),
            ranking: 2
        ),
        Review(
            userID: sampleUser.id,
            song: sampleSongs[2],
            rating: 9.4,
            comment: "This song was really good, very distinct intro and super nostalgic. It has good vocals and instrumentals I just wish it was longer.",
            dateRated: createDate(month: 2, day: 17, year: 2019),
            ranking: 3
        ),
        Review(
            userID: sampleUser.id,
            song: sampleSongs[3],
            rating: 9.1,
            comment: "Wish I could listen to this song again for the first time. Same Old Mistakes...",
            dateRated: createDate(month: 8, day: 15, year: 2021),
            ranking: 4
        ),
        Review(
            userID: sampleUser.id,
            song: sampleSongs[4],
            rating: 8.8,
            dateRated: createDate(month: 4, day: 18, year: 2023),
            ranking: 5
        ),
        Review(
            userID: sampleUser.id,
            song: sampleSongs[5],
            rating: 8.5,
            dateRated: createDate(month: 7, day: 10, year: 2022),
            ranking: 6
        ),
        Review(
            userID: sampleUser.id,
            song: sampleSongs[6],
            rating: 8.2,
            dateRated: createDate(month: 3, day: 22, year: 2021),
            ranking: 7
        ),
        Review(
            userID: sampleUser.id,
            song: sampleSongs[7],
            rating: 7.9,
            dateRated: createDate(month: 5, day: 14, year: 2023),
            ranking: 8
        ),
        Review(
            userID: sampleUser.id,
            song: sampleSongs[8],
            rating: 7.6,
            dateRated: createDate(month: 6, day: 8, year: 2022),
            ranking: 9
        ),
        Review(
            userID: sampleUser.id,
            song: sampleSongs[9],
            rating: 7.3,
            dateRated: createDate(month: 11, day: 30, year: 2020),
            ranking: 10
        ),
        Review(
            userID: sampleUser.id,
            song: sampleSongs[10],
            rating: 7.0,
            dateRated: createDate(month: 1, day: 5, year: 2024),
            ranking: 11
        ),
        Review(
            userID: sampleUser.id,
            song: sampleSongs[11],
            rating: 6.7,
            dateRated: createDate(month: 9, day: 19, year: 2021),
            ranking: 12
        ),
        Review(
            userID: sampleUser.id,
            song: sampleSongs[12],
            rating: 6.3,
            dateRated: createDate(month: 12, day: 25, year: 2022),
            ranking: 13
        ),
        Review(
            userID: sampleUser.id,
            song: sampleSongs[13],
            rating: 6.1,
            dateRated: createDate(month: 10, day: 3, year: 2023),
            ranking: 14
        ),
        Review(
            userID: sampleUser.id,
            song: sampleSongs[14],
            rating: 5.8,
            dateRated: createDate(month: 2, day: 14, year: 2024),
            ranking: 15
        )
    ]
    
    static let sampleArtistSummaries: [(id:String, artist: String, imageURL: String, averageRating: Double, songCount: Int)] = [
        ("1", "Kendrick Lamar", "kendrick", 9.7, 1),
        ("2", "Tame Impala", "tame", 9.1, 1),
        ("3", "Tyler, The Creator", "tyler", 7.8, 2),
        ("4", "Kanye West", "kanye", 7.3, 2),
        ("5", "Drake", "drake", 6.9, 2),
        ("6", "The Weeknd", "weeknd", 6.6, 2),
        ("7", "Sade", "sade", 6.3, 2),
        ("8", "Summer Walker", "summer", 6.1, 1),
        ("9", "Whitney Houston", "whitney", 5.8, 2)
    ]
    
    private static func createDate(month: Int, day: Int, year: Int) -> Date {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        return Calendar.current.date(from: components) ?? Date()
    }
}
