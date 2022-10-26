//
//  SliderModel.swift
//  InstutitApp
//
//  Created by hazem smawy on 10/13/22.
//

import SwiftUI




struct SlideShowModel:Codable  {
    var data:[SlideModel]
    var status:Int
    var msg:String
}

struct SlideModel: Codable ,Hashable{
    let mid, title, contents: String
    let url: String
    let attatch, target: String
    let img: String
    let publishedOn, createdOn, createdBy, modifiedOn: String
    let modifiedBy, status, parentID, sections: String

    enum CodingKeys: String, CodingKey {
        case mid, title, contents, url, attatch, target, img
        case publishedOn = "published_on"
        case createdOn = "created_on"
        case createdBy = "created_by"
        case modifiedOn = "modified_on"
        case modifiedBy = "modified_by"
        case status
        case parentID = "parent_id"
        case sections
    }
}

// MARK: - default data


let defaultDataForSlideShow:SlideShowModel = SlideShowModel(data:
                                                                [
                                                                    .init(mid: "11", title: "hello", contents: "hello from content", url: "no", attatch: "d", target:" ", img: "slider2", publishedOn: "", createdOn: "", createdBy: "", modifiedOn: "", modifiedBy: "", status: "", parentID: "", sections: ""),
                                                                    .init(mid: "11", title: "hello", contents: "hello from content", url: "no", attatch: "d", target:" ", img: "slider3", publishedOn: "", createdOn: "", createdBy: "", modifiedOn: "", modifiedBy: "", status: "", parentID: "", sections: "")
                                                                ],
                                                            status: 400,
                                                            msg: "no data"
)
