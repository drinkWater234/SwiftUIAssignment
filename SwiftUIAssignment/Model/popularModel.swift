//
//  popularModel.swift
//  SwiftUIAssignment
//
//  Created by Consultant on 1/7/23.
//

import Foundation

struct topLevel: Decodable
{
    var results: [theResults]
}

struct theResults: Decodable
{
    var id: Int
    var original_title: String
    var poster_path: String?
}
