//
//  AnalyticsSwiftUIView.swift
//  FirebaseAnalyticsTest
//
//  Created by Игорь Чумиков on 02.09.2024.
//


import SwiftUI
import FirebaseAnalytics

final class AnalyticsManager {
    static let shared = AnalyticsManager()
    private init() {}
    
    
    func logEvent(name: String, params: [String:Any]? = nil) {
        Analytics.logEvent(name, parameters: params)
    }
    
    // Пользовательские свойства можно только 25 шт установить такие как setUserId и и д
    func setUserId(userId: String) {
        Analytics.setUserID(userId)
    }
    
    func setUserProporty(value: String?, property: String) {
        Analytics.setUserProperty(value, forName: property)
    }
    
    // ПРИМЕР ИСПОЛЬЗОВАНИЯ СОБЫТИЙ АНАЛИТИКИ
    // Рекомендуется использовать предопределённые события (например, AnalyticsEventSignUp),
    // так как они поддерживаются многими стандартными отчётами в Firebase Analytics.

    // 1. AnalyticsEventLogin
    // Описание: Событие "Вход". Используется для отслеживания того, когда пользователь входит в приложение.
    // Пример использования: Вызовите это событие, когда пользователь успешно авторизуется.

    // 2. AnalyticsEventSignUp
    // Описание: Событие "Регистрация". Отслеживает процесс регистрации нового пользователя.
    // Пример использования: Вызовите это событие, когда пользователь завершает процесс регистрации.

    func logSignUpEvent(method: String) {
        logEvent(name: AnalyticsEventSignUp)
    }
}

struct AnalyticsSwiftUIView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            Button("Click me") {
                AnalyticsManager.shared.logEvent(name: "AnalyticsSwiftUIView_ButtonClick")
            }
            Button("Click me too") {
                AnalyticsManager.shared.logEvent(name: "AnalyticsSwiftUIView_SecondaryButtonClick", params: [
                    "screen_title" : "Hello World"
                ])
            }
        }
        .analyticsScreen(name: "AnalyticsSwiftUIView")
        .onAppear {
            AnalyticsManager.shared.logEvent(name: "AnalyticsSwiftUIView_onAppear")
        }
        .onDisappear {
            AnalyticsManager.shared.logEvent(name: "AnalyticsSwiftUIView_onDisappear")
            
            AnalyticsManager.shared.setUserId(userId: "ABC123")
            AnalyticsManager.shared.setUserProporty(value: true.description, property: "user_is_premium")
        }
    }
}

#Preview {
    AnalyticsSwiftUIView()
}
