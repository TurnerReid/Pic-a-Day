//
//  CalendarVars.swift
//  VisualCalendar
//
//  Created by Clifford Fung on 2018-10-30.
//  Copyright © 2018 Clifford Fung. All rights reserved.
//

import Foundation

let date = Date()
let calendar = Calendar.current
let day = calendar.component(.day , from: date)
var weekday = calendar.component(.weekday, from: date) - 1
var month = calendar.component(.month, from: date) - 1
var year = calendar.component(.year, from: date)
