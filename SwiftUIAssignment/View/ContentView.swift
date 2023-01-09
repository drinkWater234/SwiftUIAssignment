//
//  ContentView.swift
//  SwiftUIAssignment
//
//  Created by Consultant on 1/7/23.
//

import SwiftUI

struct ContentView: View
{
    @ObservedObject var movieVM = jsonAPI()
    
    var body: some View {
        NavigationView
        {
            
            List(movieVM.popularData.results, id: \.id)
            {
                movie in
                
                NavigationLink(destination: MovieDetailView(aMovie: movieVM.movie[movie.id] ?? movieVM.movie[-1]!),
                               label:
                               {
                    
                                    HStack
                                    {
                                        Image(uiImage: (movieVM.movie[movie.id]?.moviePoster ?? movieVM.movie[-1]?.moviePoster)!)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 70)
                                            .cornerRadius(10)
                                        
                                        VStack(alignment: .center)
                                        {
                                            Text(movie.original_title)
                                                .fontWeight(.bold)
                                                .lineLimit(2)
                                        }
                                    }
                    
                })
                
            }.listStyle(PlainListStyle())
                .navigationTitle("Popular Movies")
                
                
        }.task({
            //await movieVM.getJSONData()
            movieVM.getJSONData()
        })
        
    }
}


struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
