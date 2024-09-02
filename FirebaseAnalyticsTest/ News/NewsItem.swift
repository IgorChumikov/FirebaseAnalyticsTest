//
//  NewsItem.swift
//  FirebaseAnalyticsTest
//
//  Created by Игорь Чумиков on 02.09.2024.
//

import Foundation

struct NewsItem: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}
