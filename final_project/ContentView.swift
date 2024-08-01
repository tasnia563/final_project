
// ContentView.swift
// KWK PROJECT 2
//
// Created by Scholar on 7/30/24.
//
import SwiftUI

struct ContentView: View {
    @State private var selectedMode: String? = nil
    @State private var title: String = ""
    @State private var userInput: String = ""
    @State private var selectedPrompt = "Tap the button to get a prompt"
    @State private var need_prompt: Bool = false
    @State private  var free_write: String = "You can write about your feelings below."
    
    
    // Array of prompts
    let prompts = [
        "Write a letter to someone who has hurt you, expressing your sadness and what you wish they understood about your feelings",
        "Imagine a perfect day filled with activities that bring you joy. What would you do from morning to night?",
        "Describe a situation that made you feel extremely angry. What triggered your anger, and how did you respond?",
        "Reflect on the connection between disgust and moral values. When has something morally wrong also felt physically disgusting to you?",
        "Reflect on how fear affects your decisions and actions. Can you think of a time when fear held you back or pushed you forward?",
    ]
    
    
    
    @State private var curr_prompt: String = ""
    @State private var prompt_ind: Int = 0
    var body: some View {
        
        ZStack{
            Color.offWhite
            .ignoresSafeArea()
            Image("flower")
                .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 4.0, trailing: 0.0), resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .opacity(0.2)
                
            
            
            
            VStack {
                
                HStack {
                    Text(" JOURNAL NOTES")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.trailing, 30.0)
                    
                }
                
                HStack {
                    Button(action: {
                        selectedMode = "Freewrite"
                        need_prompt = false
                    }) {
                        Text("Freewrite")
                            .padding()
                            .background(selectedMode == "Freewrite" ?
                                        Color.hotPink : Color.black)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                        
                    }
                    
                    Button(action: {
                        selectedMode = "Get Prompt"
                        need_prompt  = true
                        curr_prompt = prompts[Int.random(in: 1..<prompts.count-1)]
                    }) {
                        Text("Get Prompt")
                            .padding()
                            .background(selectedMode == "Get Prompt" ? Color.hotPink : Color.black)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                    }
                    .padding()
                }
                if (need_prompt) {
                    Text("\(curr_prompt)")
                        .padding()
                        .background(selectedMode == "Get Prompt" ? Color.hotPink : Color.black)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                    
                } else {
                    Text("\(free_write)")
                        .padding()
                        .background(Color.hotPink)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
                
                
                
                TextField("Title: User Input", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextEditor(text: $userInput)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                HStack {
                    Button(action: {
                        // Exit action
                        
                    }) {
                        Text("Exit")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        
                    }
                    
                    Spacer()
                    Button(action: {
                        // Save action
                    }) {
                        Text("Save")
                            .padding()
                            .background(Color("sageGreen"))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        
                        
                    }
                    
                }
                .padding()
            }
            .padding()
            
            
        }
    }
}
    

#Preview {
 ContentView()
}

