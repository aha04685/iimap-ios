//
//  InitData.swift
//  iiMap
//
//  Created by li on 2018/07/22.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation

struct InitData: Codable {
    
    let facebook : [FaceBook]!
    let event : [Event]!
    let facility : [Facility]?
    let toilet : [Toilet]?
}

struct FaceBook : Codable {
    
    let like_total : String!
    let latitude : String!
    let longitude : String!
    let title : String!
    let description : String!
    let image_url : String!
}
struct Event : Codable {
    
    let actId : Int!
    let actName : String!
    let levelName : String!
    let grade1 : String!
    let grade2 : String!
    let grade3 : String!
    let grade4 : String!
    let grade5 : String!
    let grade6 : String!
    let description : String!
    let participation : String!
    let cityId : Int!
    let address : String!
    let tel : String!
    let org : String!
    let startTime : String!
    let endTime : String!
    let cycle : String!
    let noncycle : String!
    let website : String!
    let latitude : String!
    let longitude : String!
    let class1 : String!
    let class2 : String!
    let map : String?
    let travellinginfo : String!
    let parkinginfo : String!
    let charge : String!
    let remarks : String!
    let cityName : String!
    let imageUrl : String!
    
}
struct Facility : Codable {
    
}
struct Toilet : Codable {

}
