//
//  CalendarVars.swift
// Team 6: Pic-A-Day
// Developed by: Clifford

//List of Changes:
//  - Changed weekday to a "var" from "let" data type
//  - Changed month to a "var" from "let" data type
//  - Changed year to a "var" from "let" data type

//List of Known Bugs:

import Foundation

//class of calendar variables used for the viewController
let date = Date()
let calendar = Calendar.current
let day = calendar.component(.day , from: date)
var weekday = calendar.component(.weekday, from: date) - 1
var month = calendar.component(.month, from: date) - 1
var year = calendar.component(.year, from: date)
