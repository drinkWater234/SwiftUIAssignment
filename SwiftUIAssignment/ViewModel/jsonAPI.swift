//
//  jsonAPI.swift
//  SwiftUIAssignment
//
//  Created by Consultant on 1/7/23.
//

import Foundation
import UIKit

struct movieData
{
    let detailData: detailModel //= detailModel(id: 87096, adult: false, original_title: "Avatar: The Way of Water", overview: "...", release_date: "Date")
    var moviePoster: UIImage! = UIImage(named: "luffyIcon")
}

class jsonAPI: ObservableObject
{
    private let urlOfPopular = "https://api.themoviedb.org/3/movie/popular?api_key=44c6646d5f54689bfe347b17860dcc67&language=en-US&page=1"
    //private var urlOfDetail = "https://api.themoviedb.org/3/movie/<+>?api_key=44c6646d5f54689bfe347b17860dcc67&language=en-US"
    private var urlOfDetail = "https://api.themoviedb.org/3/movie/PLACEHOLDER?api_key=44c6646d5f54689bfe347b17860dcc67&language=en-US"
    private let posterLink = "https://image.tmdb.org/t/p/original"
    
    @Published var popularData: topLevel = topLevel(results: [])
    @Published var movie: [Int : movieData] = [-1: movieData(detailData: detailModel())]
    
    func getJSONData() //async
    {
        if let urlPopular = URL(string: urlOfPopular)
        {
            URLSession.shared.dataTask(with: urlPopular)
            {
                data, response, error in
                
                if let data
                {
                    do
                    {
                        let jsonPopularData = try JSONDecoder().decode(topLevel.self, from: data)
                        DispatchQueue.main.async {
                            self.popularData = jsonPopularData
                        }
                        
                        
                        for movie in jsonPopularData.results
                        {
                            let modifiedURL = self.urlOfDetail.replacingOccurrences(of: "PLACEHOLDER", with: "\(movie.id)")
                            if let urlDetail = URL(string: modifiedURL)
                            {
                                URLSession.shared.dataTask(with: urlDetail)
                                {
                                    data, response, error in
                                    
                                    if let data
                                    {
                                        do
                                        {
                                            let jsonDetailData = try JSONDecoder().decode(detailModel.self, from: data)
                                            let theMovieData = movieData(detailData: jsonDetailData, moviePoster: nil)
                                            
                                            DispatchQueue.main.async {
                                                self.movie[jsonDetailData.id] = theMovieData
                                                var thePosterLink = self.posterLink
                                                thePosterLink += theMovieData.detailData.poster_path
                                                self.downloadImage(url: URL(string: thePosterLink)!, id: jsonDetailData.id)
                                            }
                                            
                                        } catch {
                                            print(error)
                                        }
                                    }
                                }.resume()
                            }
                        }
                    } catch {
                        print(error)
                    }
                }
                
            }.resume()
        }
    }
    
    func downloadImage(url: URL, id: Int)
    {
        URLSession.shared.dataTask(with: url)
        {
            🫠, response, error in
            
            if let 🫠
            {
                self.movie[id]?.moviePoster = UIImage(data: 🫠)
            } else {
                fatalError("Cannot get image")
            }
        }.resume()
    }
}
