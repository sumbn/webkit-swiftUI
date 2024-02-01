//
//  DecodeObject.swift
//  testWebkit
//
//  Created by dr.Strange on 02/02/2024.
//

import Foundation
class PersonDecode : Decodable {
    var name        : String?
      var address     : String?
      var latitude    : Double?
      var longitude   : Double?
      var maidenName  : String?
      var birthData   : String?
      var phoneH      : String?
      var phoneW      : String?
      var emailU      : String?
      var emailD      : String?
      var username    : String?
      var password    : String?
      var domain      : String?
      var useragent   : String?
      var ipv4        : String?
      var macaddress  : String?
      var plasticcard : String?
      var cardexpir   : String?
      var bonus       : Int?
      var company     : String?
      var color       : String?
      var uuid        : String?
      var height      : Int?
      var weight      : Double?
      var blood       : String?
      var eye         : String?
      var hair        : String?
      var pict        : String?
      var url         : String?
      var sport       : String?
      var ipv4Url     : String?
      var emailUrl    : String?
      var domainUrl   : String?

      enum CodingKeys: String, CodingKey {

        case name        = "name"
        case address     = "address"
        case latitude    = "latitude"
        case longitude   = "longitude"
        case maidenName  = "maiden_name"
        case birthData   = "birth_data"
        case phoneH      = "phone_h"
        case phoneW      = "phone_w"
        case emailU      = "email_u"
        case emailD      = "email_d"
        case username    = "username"
        case password    = "password"
        case domain      = "domain"
        case useragent   = "useragent"
        case ipv4        = "ipv4"
        case macaddress  = "macaddress"
        case plasticcard = "plasticcard"
        case cardexpir   = "cardexpir"
        case bonus       = "bonus"
        case company     = "company"
        case color       = "color"
        case uuid        = "uuid"
        case height      = "height"
        case weight      = "weight"
        case blood       = "blood"
        case eye         = "eye"
        case hair        = "hair"
        case pict        = "pict"
        case url         = "url"
        case sport       = "sport"
        case ipv4Url     = "ipv4_url"
        case emailUrl    = "email_url"
        case domainUrl   = "domain_url"
      
      }
}
