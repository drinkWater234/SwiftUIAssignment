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
            Image(uiImage: aMovie.moviePoster!)
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .cornerRadius(20)
            
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
