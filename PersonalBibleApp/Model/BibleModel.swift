//
//  BibleModel.swift
//  PersonalBibleApp
//
//  Created by Corey Edh on 2/22/23.
//

import Foundation

enum BibleTranslation: String, CaseIterable, Equatable{
    case kjv = "KJV"
    case web = "Web"
    case clementine = "Clementine"
    
    var fullNameOfTranslation: String {
        switch self{
        case .kjv:
            return "King James Verison"
        case .web:
            return "World English Bible"
        case .clementine:
            return "Clementine Latin Vulgate"
        }
    }
}

enum BooksInBible: String, CaseIterable{
    case Genesis
    case Exodus
    case Leviticus
    case Numbers
    case Deuternonomy
    case Joshua
    case Judges
    case Ruth
    case Samuel1 = "1 Samuel"
    case Samuel2 = "2 Samuel"
    case Kings1 = "1 Kings"
    case Kings2 = "2 Kings"
    case Chronicles1
    case Chronicles2
    case Ezra
    case Nehemiah
    case Esther
    case Job
    case Psalms
    case Proverbs
    case Ecclesiastes
    case SongOfSongs
    case Isaiah
    case Jeremiah
    case Lamentations
    case Ezekiel
    case Daniel
    case Hosea
    case Joel
    case Amos
    case Obadiah
    case Jonah
    case Micah
    case Nahum
    case Habakkuk
    case Zephaniah
    case Haggai
    case Zechariah
    case Malachi
    case Matthew
    case Mark
    case Luke
    case John
    case Acts
    case Romans
    case Corinthians1 = "1 Corinthians"
    case Corinthians2 = "2 Corinthians"
    case Galatians
    case Ephesians
    case Philippians
    case Colossians
    case Thessalonians1 = "1 Thessalonians"
    case Thessalonians2 = "2 Thessalonians"
    case Timothy1 = "2 Timothy"
    case Timothy2 = "1 Timothy"
    case Titus
    case Philemon
    case Hebrews
    case James
    case Peter1 = "1 Peter"
    case Peter2 = "2 Peter"
    case John1 = "1 John"
    case John2 = "2 John"
    case John3 = "3 John"
    case Jude
    case Revelation
        
    //Info on Books
    var info: (id: String, amountOfChapters: Int) {
        switch self {
        case .Genesis:
            return ("GEN",50)
        case .Exodus:
            return ("EXO",40)
        case .Leviticus:
            return ("LEV",27)
        case .Numbers:
            return ("NUM",36)
        case .Deuternonomy:
            return ("DEU",34)
        case .Joshua:
            return ("JOS",24)
        case .Judges:
            return ("JDG",21)
        case .Ruth:
            return ("RTH",4)
        case .Samuel1:
            return ("1SM",31)
        case .Samuel2:
            return ("2SM",24)
        case .Kings1:
            return ("1KI",22)
        case .Kings2:
            return ("2KI",25)
        case .Chronicles1:
            return ("1CH",29)
        case .Chronicles2:
            return ("2CH",36)
        case .Ezra:
            return ("EZR",10)
        case .Nehemiah:
            return ("NEH",13)
        case .Esther:
            return ("EST",10)
        case .Job:
            return ("JOB",42)
        case .Psalms:
            return ("PSA",150)
        case .Proverbs:
            return ("PRO",31)
        case .Ecclesiastes:
            return ("ECC",12)
        case .SongOfSongs:
            return ("SNG",8)
        case .Isaiah:
            return ("ISA",66)
        case .Jeremiah:
            return ("JER",52)
        case .Lamentations:
            return ("LAM",5)
        case .Ezekiel:
            return ("EZK",48)
        case .Daniel:
            return ("DAN",12)
        case .Hosea:
            return ("HOS",14)
        case .Joel:
            return ("JOL",3)
        case .Amos:
            return ("AMO",8)
        case .Obadiah:
            return ("OBA",1) //Has 22 verses
        case .Jonah:
            return ("JON",4)
        case .Micah:
            return ("MIC",7)
        case .Nahum:
            return ("NAM",3)
        case .Habakkuk:
            return ("HAB",3)
        case .Zephaniah:
            return ("ZEP",3)
        case .Haggai:
            return ("HAG",2)
        case .Zechariah:
            return ("ZEC",14)
        case .Malachi:
            return ("MAL",4)
        case .Matthew:
            return ("MAT",28)
        case .Mark:
            return ("MRK",16)
        case .Luke:
            return ("LUK",24)
        case .John:
            return ("JHN",21)
        case .Acts:
            return ("ACT",28)
        case .Romans:
            return ("ROM",16)
        case .Corinthians1:
            return ("1CO",16)
        case .Corinthians2:
            return ("2CO",13)
        case .Galatians:
            return ("GAL",6)
        case .Ephesians:
            return ("EPH",6)
        case .Philippians:
            return ("PHP",4)
        case .Colossians:
            return ("COL",4)
        case .Thessalonians1:
            return ("1TH",5)
        case .Thessalonians2:
            return ("2TH",3)
        case .Timothy1:
            return ("1TI",6)
        case .Timothy2:
            return ("2TI",4)
        case .Titus:
            return ("TIT",3)
        case .Philemon:
            return (self.rawValue,1) //25 Verses; API seems to be missing Philemon and it returns Phillipians, ID is PHLM, however returns nothing
        case .Hebrews:
            return ("HEB",13)
        case .James:
            return ("JAS",5)
        case .Peter1:
            return ("1PE",5)
        case .Peter2:
            return ("2PE",3)
        case .John1:
            return ("1JN",5)
        case .John2:
            return ("2JN",1) // 13 Verses
        case .John3:
            return ("3JN",1) // 14 Verses
        case .Jude:
            return ("JUD",1) // 24 Verses
        case .Revelation:
            return ("REV",22)
        }
    }
}
