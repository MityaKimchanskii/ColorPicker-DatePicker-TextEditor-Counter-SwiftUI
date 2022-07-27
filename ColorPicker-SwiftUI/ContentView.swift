//
//  ContentView.swift
//  ColorPicker-SwiftUI
//
//  Created by Mitya Kim on 7/26/22.
//

import SwiftUI

// MARK: - Counter
class Counter: ObservableObject {
    @Published var value: Int = 0
}

struct CounterView: View {
    @ObservedObject var counter = Counter()
    
    var body: some View {
        VStack {
            Text("\(counter.value)")
            Button {
                counter.value += 3
            } label: {
                Text("Counter")
                    .foregroundColor(.white)
            }.padding()
                .background(.blue)
                .cornerRadius(20)
        }
    }
}

struct ContentView: View {
    
    // MARK: - ColorPicker
    @State private var color: Color = .white
    
    // MARK: - DatePicker
    @State private var selectedDate = Date()
    
    // MARK: - TextEditor
    @State private var description: String = ""
    
    var body: some View {
        VStack {
            // MARK: - ColorPicker
            ColorPicker("Select a color", selection: self.$color)
                .padding()
            
            // MARK: - DatePicker
            DatePicker("Select date", selection: $selectedDate)
                .padding()
            
            // MARK: - TextEditor
            TextEditor(text: $description)
                .padding()
                .background(.green)
                .cornerRadius(30)
                .frame(width: 300, height: 300)
            
            // MARK: - Counter
            VStack {
                Text("Counter View")
                CounterView()
            }.padding()
            .background(.yellow)
            .cornerRadius(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
