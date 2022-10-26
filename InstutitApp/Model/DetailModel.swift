//
//  DetailModel.swift
//  InstutitApp
//
//  Created by hazem smawy on 10/25/22.
//

import Foundation
// MARK: - Welcome

// MARK: - Welcome
struct DetailsModel: Codable {
    let data:[Datum]
    let status: Int
    let msg: String
}


// MARK: - Datum
struct Datum: Codable {
    let pid, title, content: String
    let img: String
    let attatches, metaKeywords, metaDescription, publishedOn: String
    let createdOn, createdBy, modifiedOn, modifiedBy: String
    let views, status, guide, cid: String

    enum CodingKeys: String, CodingKey {
        case pid, title, content, img, attatches
        case metaKeywords = "meta_keywords"
        case metaDescription = "meta_description"
        case publishedOn = "published_on"
        case createdOn = "created_on"
        case createdBy = "created_by"
        case modifiedOn = "modified_on"
        case modifiedBy = "modified_by"
        case views, status, guide, cid
    }
}


let defaultDetailsModel:DetailsModel = DetailsModel(data:[.init(
    pid: "", title: "", content: "", img: "", attatches: "", metaKeywords: "", metaDescription: "", publishedOn: "", createdOn: "", createdBy: "", modifiedOn: "", modifiedBy: "", views: "", status: "", guide: "", cid: "")], status: 400, msg: "there is no data")
