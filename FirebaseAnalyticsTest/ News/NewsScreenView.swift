//
//  NewsScreenView.swift
//  FirebaseAnalyticsTest
//
//  Created by Игорь Чумиков on 02.09.2024.
//

import SwiftUI

struct NewsScreenView: View {
    let newsItems: [NewsItem] = [
        NewsItem(title: "News 1", description: "Description for News 1"),
        NewsItem(title: "News 2", description: "Description for News 2"),
        NewsItem(title: "News 3", description: "Description for News 3"),
        NewsItem(title: "News 4", description: "Description for News 4"),
        NewsItem(title: "News 5", description: "Description for News 5"),
        NewsItem(title: "News 6", description: "Description for News 6"),
        NewsItem(title: "News 7", description: "Description for News 7"),
        NewsItem(title: "News 8", description: "Description for News 8"),
        NewsItem(title: "News 9", description: "Description for News 9"),
        NewsItem(title: "News 10", description: "Description for News 10")
    ]
    
    var body: some View {
        NavigationView {
            List(newsItems) { item in
                NavigationLink(destination: NewsDetailView(newsItem: item)) {
                    Text(item.title)
                        .onTapGesture {
                            AnalyticsManager.shared.logEvent(name: "NewsScreen_ItemSelected", params: [
                                "news_title": item.title
                            ])
                        }
                }
            }
            .navigationTitle("News")
            .analyticsScreen(name: "NewsScreenView")
        }
    }
}

#Preview {
    NewsScreenView()
}
