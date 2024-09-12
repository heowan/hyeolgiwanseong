//
//  DateFormatter+Extensions.swift
//  hyeolgiwanseong
//
//  Created by Heowan on 9/12/24.
//

import Foundation

extension DateFormatter {

    static let customFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd EEEE a h:mm"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }()
}
