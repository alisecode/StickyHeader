//
//  MusicModel.swift
//  StickyHeader
//
//  Created by Alisa Serhiienko on 17.12.2023.
//

import SwiftUI

struct Song: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
}

let songs = [Song(title: "Burn the Witch", artist: "Radiohead"),
             Song(title: "Daydreaming", artist: "Radiohead"),
             Song(title: "Decks Dark", artist: "Radiohead"),
             Song(title: "Desert Island Disk", artist: "Radiohead"),
             Song(title: "Ful Stop", artist: "Radiohead"),
             Song(title: "Glass Eyes", artist: "Radiohead"),
             Song(title: "Identikit", artist: "Radiohead"),
             Song(title: "The Numbers", artist: "Radiohead"),
             Song(title: "Present Tense", artist: "Radiohead"),
             Song(title: "Tinker Tailor Soldier Sailor Rich Man Poor...", artist: "Radiohead"),
             Song(title: "True Love Waits", artist: "Radiohead")]
