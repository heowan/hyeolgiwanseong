//
//  StateHelper.swift
//  hyeolgiwanseong
//
//  Created by Heowan on 9/10/24.
//

import Foundation

struct StateHelper {
    
    // 혈압 상태 분류
    static func getBloodPressState(systolic: Int64, diastolic: Int64) -> BloodPressureState {
        switch (systolic, diastolic) {
        case (let s, let d) where s < 90 || d < 60:
            return .hypotension
        case (let s, let d) where s < 120 && d < 80:
            return .normal
        case (let s, let d) where (s >= 120 && s <= 129) && d < 80:
            return .caution
        case (let s, let d) where (s >= 130 && s <= 139) || (d >= 80 && d <= 89):
            return .preHypertension
        case (let s, let d) where (s >= 140 && s <= 159) || (d >= 90 && d <= 99):
            return .hypertensionStage1
        case (let s, let d) where s >= 160 || d >= 100:
            return .hypertensionStage2
        case (let s, let d) where s >= 140 && d < 90:
            return .systolicHypertension
        default:
            return .unknown
        }
    }
    
    // 심박수 상태 분류
    static func getHeartRateState(hearRate: Int64) -> HeartRateState {
        switch hearRate {
        case ..<50:
            return .veryLow
        case 50..<60:
            return .low
        case 60...100:
            return .normal
        case 101...120:
            return .high
        case 121...:
            return .veryHigh
        default:
            return .unknown
        }
    }
    
    // 맥압 상태 분류
    static func getPulPressState(pulPress: Int64) -> PulpressState {
        if pulPress < 35 {
            return .low
        } else if pulPress > 45 {
            return .high
        } else {
            return .normal
        }
    }
    
    // 평균동맥압 상태 분류
    static func getMeanArtPressState(MeanArtPress: Int64) -> MeanArtPressState {
        if MeanArtPress < 70 {
            return .low
        } else if MeanArtPress > 100 {
            return .high
        } else {
            return .normal
        }
    }
    
    
}
