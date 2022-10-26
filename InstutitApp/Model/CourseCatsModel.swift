//
//  CourseCatsModel.swift
//  InstutitApp
//
//  Created by hazem smawy on 10/24/22.
//
/*
 "cid": "5",
            "title": "التصميم الجرافيكي والمعماري",
            "content": "\u003Cp\u003Eسجل في دورات التصميم الجرافيكي, تصميم مواقع الويب, الوسائط المتعددة, وهندسة العمارة والتصميم الداخلي, وانضم الى دورات ادوبي فوتوشوب, اليستريتر, وانديزاين, وتعلم التسويق الالكتروني, الرسم المعماري ببرامج اتوديسك اوتوكاد, ريفيت, و3d Max.\u003C/p\u003E\r\n",
            "img": "https://www.sh-alialmatry.com/Project/uploads/posts/2022101204262971.jpg",
            "meta_keywords": "التصميم,الجرافيكي,والمعماري",
            "meta_description": "التصميم الجرافيكي والمعماري",
            "published_on": "2022-10-12 16:25:00",
            "created_on": "2022-10-12 16:26:30",
            "created_by": "1",
            "modified_on": "2022-10-12 16:26:30",
            "modified_by": "1",
            "views": "0",
            "status": "1",
            "guide": "التصميم-الجرافيكي-والمعماري",
            "sections": "2"
 */

struct CoursesCatsModel:Codable  {
    var data:[CatsModel]
    var status:Int
    var msg:String
}

struct CatsModel: Codable ,Hashable{
    let cid, title, content: String
    let img: String
    let metaKeywords, metaDescription: String
    
    let publishedOn, createdOn, createdBy, modifiedOn: String
    let modifiedBy,views, status, guide, sections: String

    enum CodingKeys: String, CodingKey {
        case cid, title, content, img
        case metaKeywords = "meta_keywords"
        case metaDescription = "meta_description"
        case publishedOn = "published_on"
        case createdOn = "created_on"
        case createdBy = "created_by"
        case modifiedOn = "modified_on"
        case modifiedBy = "modified_by"
        case views
        case status
        case guide
        case sections
       
    }
}


// MARK: - default data
let defaultCatsData:CoursesCatsModel = CoursesCatsModel(data: [

    .init(cid: "5", title: "التصميم الجرافيكي والمعماري", content: "التصميم الجرافيكي والمعماري", img: "slider1", metaKeywords: "التصميم,الجرافيكي,والمعماري", metaDescription: "التصميم,الجرافيكي,والمعماري", publishedOn: "التصميم,الجرافيكي,والمعماري", createdOn: "التصميم,الجرافيكي,والمعماري", createdBy: "التصميم,الجرافيكي,والمعماري", modifiedOn: "التصميم,الجرافيكي,والمعماري", modifiedBy: "التصميم,الجرافيكي,والمعماري", views: "0", status: "التصميم,الجرافيكي,والمعماري", guide: "التصميم,الجرافيكي,والمعماري", sections: "التصميم,الجرافيكي,والمعماري")
], status: 200, msg: "kkkk")
