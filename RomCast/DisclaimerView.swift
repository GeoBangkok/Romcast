//
//  DisclaimerView.swift
//  RomCast
//
//  Created by standard on 1/29/26.
//

import SwiftUI

struct DisclaimerView: View {
    @AppStorage("disclaimerAccepted") private var disclaimerAccepted = false
    @State private var showMainApp = false
    @State private var animateText = false

    var body: some View {
        ZStack {
            // Black background
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 30) {
                // Icon
                Image(systemName: "info.circle.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                Color(red: 233/255, green: 30/255, blue: 99/255),
                                Color(red: 236/255, green: 64/255, blue: 122/255)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .padding(.top, 60)

                // Title
                Text("Important Notice")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                Color(red: 233/255, green: 30/255, blue: 99/255),
                                Color(red: 240/255, green: 98/255, blue: 146/255)
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .opacity(animateText ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: animateText)

                // Disclaimer content
                VStack(alignment: .leading, spacing: 20) {
                    DisclaimerSection(
                        icon: "theatermasks.fill",
                        title: "Entertainment Only",
                        description: "This product is entirely for entertainment purposes. All stories, scenarios, and interactions are fictional."
                    )

                    DisclaimerSection(
                        icon: "person.2.fill",
                        title: "Fictional Characters",
                        description: "None of the characters in this app are real people. They are entirely fictional creations for your entertainment."
                    )

                    DisclaimerSection(
                        icon: "bubble.left.and.bubble.right.fill",
                        title: "AI Chat Experience",
                        description: "The AI chat is designed purely for entertainment. It creates interactive stories that you choose and play out."
                    )

                    DisclaimerSection(
                        icon: "sparkles",
                        title: "Enjoy the Experience",
                        description: "We hope you enjoy the creative storytelling and interactive entertainment experience!"
                    )
                }
                .padding(.horizontal, 30)
                .opacity(animateText ? 1 : 0)
                .animation(.easeIn(duration: 0.5).delay(0.2), value: animateText)

                Spacer()

                // Acceptance section
                VStack(spacing: 20) {
                    Text("By continuing, you acknowledge that you understand this is an entertainment app with fictional content.")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)

                    // Accept button
                    Button(action: {
                        disclaimerAccepted = true
                        showMainApp = true
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            Color(red: 233/255, green: 30/255, blue: 99/255),
                                            Color(red: 236/255, green: 64/255, blue: 122/255)
                                        ],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .frame(width: 250, height: 55)

                            Text("I Understand")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .foregroundColor(.white)
                        }
                    }
                    .opacity(animateText ? 1 : 0)
                    .animation(.easeIn(duration: 0.5).delay(0.4), value: animateText)
                }
                .padding(.bottom, 50)
            }
        }
        .onAppear {
            animateText = true
        }
        .fullScreenCover(isPresented: $showMainApp) {
            ContentView()
        }
    }
}

struct DisclaimerSection: View {
    let icon: String
    let title: String
    let description: String

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(Color(red: 236/255, green: 64/255, blue: 122/255))
                .frame(width: 30)

            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)

                Text(description)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .fixedSize(horizontal: false, vertical: true)
            }

            Spacer()
        }
    }
}

// Simplified disclaimer for returning users
struct SimpleDisclaimerView: View {
    @AppStorage("disclaimerAccepted") private var disclaimerAccepted = false
    @State private var showMainApp = false

    var body: some View {
        ZStack {
            // Black background with gradient
            LinearGradient(
                colors: [
                    Color.black,
                    Color(red: 233/255, green: 30/255, blue: 99/255).opacity(0.1)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 40) {
                Spacer()

                // Heart icon
                Image(systemName: "heart.text.square.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                Color(red: 233/255, green: 30/255, blue: 99/255),
                                Color(red: 244/255, green: 67/255, blue: 54/255)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )

                VStack(spacing: 15) {
                    Text("Entertainment Disclaimer")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.white)

                    Text("All characters and stories are fictional.\nThis app is for entertainment purposes only.")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                }

                Spacer()

                // Continue button
                Button(action: {
                    disclaimerAccepted = true
                    showMainApp = true
                }) {
                    Text("I Understand & Continue")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(width: 280, height: 55)
                        .background(
                            LinearGradient(
                                colors: [
                                    Color(red: 233/255, green: 30/255, blue: 99/255),
                                    Color(red: 236/255, green: 64/255, blue: 122/255)
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(27.5)
                }
                .padding(.bottom, 60)
            }
        }
        .fullScreenCover(isPresented: $showMainApp) {
            ContentView()
        }
    }
}

#Preview {
    DisclaimerView()
}

#Preview("Simple") {
    SimpleDisclaimerView()
}