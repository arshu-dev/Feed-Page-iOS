//
//  Parser.swift
//  VimeoTestApp
//
//  Created by Arshad Parwez on 04/02/17.
//  Copyright © 2017 Arshd Parwez. All rights reserved.
//

import Foundation

public struct Parser {
    
    // MARK: - AlbumVideos Parser
    open class AlbumVideos {
        
        var video_id: Int?
        var title: String?
        var description: String?
        var url: String?
        var upload_date: String?
        var mobile_url: String?
        var thumbnail_small: String?
        var thumbnail_medium: String?
        var thumbnail_large: String?
        var user_id: Int?
        var user_name: String?
        var user_url: String?
        var user_portrait_small: String?
        var user_portrait_medium: String?
        var user_portrait_large: String?
        var user_portrait_huge: String?
        var stats_number_of_likes: Int?
        var stats_number_of_plays: Int?
        var stats_number_of_comments: Int?
        var duration: Int?
        var width: Int?
        var height: Int?
        var tags: String?
        
        public init(jsonObject: NSDictionary) {
            if let video_id = jsonObject["id"] as? Int {
                self.video_id = video_id
            }
            if let title = jsonObject["title"] as? String {
                self.title = title
            }
            if let description = jsonObject["description"] as? String {
                self.description = description
            }
            if let url = jsonObject["url"] as? String {
                self.url = url
            }
            if let upload_date = jsonObject["upload_date"] as? String {
                self.upload_date = upload_date
            }
            if let mobile_url = jsonObject["mobile_url"] as? String {
                self.mobile_url = mobile_url
            }
            if let thumbnail_small = jsonObject["thumbnail_small"] as? String {
                self.thumbnail_small = thumbnail_small
            }
            if let thumbnail_medium = jsonObject["thumbnail_medium"] as? String {
                self.thumbnail_medium = thumbnail_medium
            }
            if let thumbnail_large = jsonObject["thumbnail_large"] as? String {
                self.thumbnail_large = thumbnail_large
            }
            if let user_id = jsonObject["user_id"] as? Int {
                self.user_id = user_id
            }
            if let user_name = jsonObject["user_name"] as? String {
                self.user_name = user_name
            }
            if let user_url = jsonObject["user_url"] as? String {
                self.user_url = user_url
            }
            if let user_portrait_small = jsonObject["user_portrait_small"] as? String {
                self.user_portrait_small = user_portrait_small
            }
            if let user_portrait_medium = jsonObject["user_portrait_medium"] as? String {
                self.user_portrait_medium = user_portrait_medium
            }
            if let user_portrait_large = jsonObject["user_portrait_large"] as? String {
                self.user_portrait_large = user_portrait_large
            }
            if let user_portrait_huge = jsonObject["user_portrait_huge"] as? String {
                self.user_portrait_huge = user_portrait_huge
            }
            if let stats_number_of_likes = jsonObject["stats_number_of_likes"] as? Int {
                self.stats_number_of_likes = stats_number_of_likes
            }
            if let stats_number_of_plays = jsonObject["stats_number_of_plays"] as? Int {
                self.stats_number_of_plays = stats_number_of_plays
            }
            if let stats_number_of_comments = jsonObject["stats_number_of_comments"] as? Int {
                self.stats_number_of_comments = stats_number_of_comments
            }
            if let duration = jsonObject["duration"] as? Int {
                self.duration = duration
            }
            if let width = jsonObject["width"] as? Int {
                self.width = width
            }
            if let height = jsonObject["height"] as? Int {
                self.height = height
            }
            if let tags = jsonObject["tags"] as? String {
                self.tags = tags
            }
        }
    }
}
