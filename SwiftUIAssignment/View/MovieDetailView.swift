//
//  MovieDetailView.swift
//  SwiftUIAssignment
//
//  Created by Consultant on 1/7/23.
//

import SwiftUI

struct MovieDetailView: View {
    
    var aMovie : movieData
    
    var body: some View {
        VStack(spacing: 20)
        {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(aMovie.detailData.poster_path)" )) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
            } placeholder: {
                Color.black
            }
            
            Text(aMovie.detailData.original_title)
                .font(.title)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Text(aMovie.detailData.overview)
                .font(.body)
                .padding()
        }
    }
}
