//
//  detailModel.swift
//  SwiftUIAssignment
//
//  Created by Consultant on 1/7/23.
//

import Foundation

struct detailModel: Decodable
{
    var id: Int = -1
    var adult: Bool = false
    var original_title: String = "DNE"
    var overview: String = "DNE"
    var poster_path: String = "DNE"
    var release_date: String = "DNE"
}
