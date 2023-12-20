//
//  ContentView.swift
//  StickyHeader
//
//  Created by Alisa Serhiienko on 17.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPlaying = false
    @State private var isFavourite = false
    @State private var download = false
    @State private var shuffle = false


    func makeOffsetY(reader: GeometryProxy) -> CGFloat {
        let offsetY: CGFloat = -reader.frame(in: .named("scroll")).minY
        
        if offsetY < 0 {
            return offsetY / 1.4
        }
        return offsetY
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.systemBlack
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                GeometryReader { proxy in
                    let offsetY = makeOffsetY(reader: proxy)
                    let height: CGFloat = (proxy.size.height - offsetY) + offsetY / 4
                    let minHeight: CGFloat = 125
                    let opacity = (height - minHeight) / (proxy.size.height - minHeight)

                    
                    Image(.album)
                        .resizable()
                        .frame(width: max(0, height), height: max(0, height))
                        .offset(y: offsetY)
                        .opacity(opacity)
                        .shadow(color: .systemBlack.opacity(0.6), radius: 36)
                    .frame(width: proxy.size.width)
                }
                .frame(height: 240)
                
                
                albumDetails
                    .padding(.horizontal)
                

                songsListView
                    .padding(.horizontal)
                
            }
            .coordinateSpace(name: "scroll")
            
            .background(alignment: .top) {
                LinearGradient(colors: [.artistBackground.opacity(0.66), .systemBlack.opacity(0.6)], startPoint: .top, endPoint: .bottom)
                    .frame(height: 650)
                    .ignoresSafeArea()
            }
        }
        
    }
    
  
}

extension ContentView {
    
    var songsListView: some View {
        ForEach(songs) { song in
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(song.title)
                            .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(.white)
                        
                        Spacer()
                        
                        Image(systemName: "ellipsis")
                            .foregroundStyle(Color.systemGray)
                            .font(.system(size: 20))
                            .frame(maxHeight: .infinity)
                            .offset(y: 5)
                    }
     
                        Text(song.artist)
                        .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(.white.opacity(0.6))
                    
                        
                    Spacer()

                    }
                
                Spacer()
                
            }
            
        }
    }
    
    var albumDetails: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text("A Moon Shaped Pool")
                    .font(.system(size: 27, weight: .bold))
                    .padding(.top, 10)
                
                HStack {
                    Image(.avatar)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24, height: 32)
                        .clipShape(Circle())
                    
                    Text("Radiohead")
                        .font(.system(size: 15, weight: .bold))
                        .bold()
                }
                
                Text("Album • 2016")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(Color.systemGray)
                
                HStack(spacing: 16) {
                    Button(action: {
                        isFavourite.toggle()
                    }, label: {
                        Image(systemName: isFavourite ? "plus.circle" : "plus.circle.fill")
                            .font(.system(size: 27))
                            .foregroundStyle(isFavourite ? Color.green : .systemGray)
                    })
                    
                    Button(action: {
                        download.toggle()
                    }, label: {
                        Image(systemName:  "arrow.down.circle")
                            .font(.system(size: 27))
                            .foregroundStyle(download ? Color.green : .systemGray)
                    })
                    
                    Image(systemName: "ellipsis")
                        .foregroundStyle(Color.systemGray)
                        .font(.system(size: 24, weight: .regular))
                        .frame(maxHeight: .infinity)
                        .offset(y: -1)
                    
                    Spacer()
                    
                    Button(action: {
                        shuffle.toggle()
                    }, label: {
                        Image(systemName:  "shuffle")
                            .font(.system(size: 27))
                            .foregroundStyle(shuffle ? Color.green : .systemGray)
                    })
                    
                    Button(action: {
                        isPlaying.toggle()
                    }, label: {
                        ZStack {
                            Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                .font(.system(size: 52))
                                .foregroundStyle(.green)
                                .padding(.top, 3)
                                .padding(.bottom, 4)

                            
                            
                        }
                    })
                }
    
            }
            .foregroundStyle(.white)
            Spacer()
         
        }
    }

}





#Preview {
    ContentView()
}
