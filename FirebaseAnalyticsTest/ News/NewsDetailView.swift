//
//  NewsDetailView.swift
//  FirebaseAnalyticsTest
//
//  Created by Игорь Чумиков on 02.09.2024.
//

import SwiftUI

struct NewsDetailView: View {
    let newsItem: NewsItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(newsItem.title)
                .font(.largeTitle)
                .padding(.top)
            
            Text(newsItem.description)
                .font(.body)
            
            Spacer()
        }
        .padding()
        .navigationTitle(newsItem.title)
        .analyticsScreen(name: "NewsDetailView")
    }
}

#Preview {
    NewsDetailView(newsItem: NewsItem(title: "News 1", description: "Description for News 1"))
}
