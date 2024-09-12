//
//  HealthStateEnums.swift
//  hyeolgiwanseong
//
//  Created by Heowan on 9/12/24.
//

import Foundation

// 혈압 상태
enum BloodPressureState: String {
    case hypotension = "저혈압"
    case normal = "정상혈압"
    case caution = "주의혈압"
    case preHypertension = "고혈압전단계"
    case hypertensionStage1 = "고혈압 1기"
    case hypertensionStage2 = "고혈압 2기"
    case systolicHypertension = "수축기단독고혈압"
    case unknown = "측정필요"
}

// 심박수 상태
enum HeartRateState: String {
    
    case veryLow = "매우 낮음"
    case low = "낮음"
    case normal = "적정"
    case high = "높음"
    case veryHigh = "매우 높음"
    case unknown = "측정필요"
}

// 맥압 상태
enum PulpressState: String {
    
    case low = "낮음"
    case normal = "적정"
    case high = "높음"
    case unknown = "측정필요"
}

// 평균동맥압 상태
enum MeanArtPressState: String {
    
    case low = "낮음"
    case normal = "적정"
    case high = "높음"
    case unknown = "측정필요"
}
