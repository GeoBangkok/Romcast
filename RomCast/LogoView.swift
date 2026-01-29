//
//  LogoView.swift
//  RomCast
//
//  Created by standard on 1/29/26.
//

import SwiftUI

struct LogoView: View {
    @AppStorage("disclaimerAccepted") private var disclaimerAccepted = false
    @State private var showNextScreen = false
    @State private var pulseAnimation = false

    var body: some View {
        ZStack {
            // Black background
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 40) {
                Spacer()

                // Logo
                HStack(spacing: 0) {
                    Text("Romcast")
                        .font(.system(size: 72, weight: .bold, design: .rounded))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color(hex: "E91E63"), Color(hex: "EC407A"), Color(hex: "F06292")],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )

                    // Heart icon
                    Image(systemName: "heart.fill")
                        .font(.system(size: 60))
                        .foregroundColor(Color(hex: "E53935"))
                        .offset(x: -5, y: -5)
                }

                Spacer()

                // Continue button with pulsating effect
                Button(action: {
                    showNextScreen = true
                }) {
                    Text("Continue")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .frame(width: 200, height: 55)
                        .background(
                            LinearGradient(
                                colors: [Color(hex: "E91E63"), Color(hex: "EC407A")],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(27.5)
                        .shadow(color: Color(hex: "E91E63").opacity(0.4), radius: pulseAnimation ? 20 : 10, x: 0, y: 0)
                        .scaleEffect(pulseAnimation ? 1.05 : 1.0)
                        .animation(
                            Animation.easeInOut(duration: 1.5)
                                .repeatForever(autoreverses: true),
                            value: pulseAnimation
                        )
                }
                .padding(.bottom, 80)
            }
        }
        .onAppear {
            pulseAnimation = true
        }
        .fullScreenCover(isPresented: $showNextScreen) {
            if disclaimerAccepted {
                ContentView()
            } else {
                DisclaimerView()
            }
        }
    }
}

// Color extension for hex support
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// Alternative logo design with better matching
struct LogoViewAlternative: View {
    @AppStorage("disclaimerAccepted") private var disclaimerAccepted = false
    @State private var showNextScreen = false
    @State private var pulseAnimation = false

    var body: some View {
        ZStack {
            // Black background
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 50) {
                Spacer()

                // Logo matching the image style
                ZStack {
                    // Text with gradient
                    Text("Romcast")
                        .font(.system(size: 80, weight: .bold, design: .default))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    Color(red: 233/255, green: 30/255, blue: 99/255),
                                    Color(red: 236/255, green: 64/255, blue: 122/255),
                                    Color(red: 240/255, green: 98/255, blue: 146/255)
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )

                    // Heart overlay
                    Image(systemName: "heart.fill")
                        .font(.system(size: 65))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    Color(red: 229/255, green: 57/255, blue: 53/255),
                                    Color(red: 244/255, green: 67/255, blue: 54/255)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .offset(x: 165, y: -8)
                }

                Spacer()

                // Pulsating Continue Button
                Button(action: {
                    withAnimation {
                        showNextScreen = true
                    }
                }) {
                    ZStack {
                        // Outer glow effect
                        RoundedRectangle(cornerRadius: 30)
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color(red: 233/255, green: 30/255, blue: 99/255).opacity(0.3),
                                        Color(red: 236/255, green: 64/255, blue: 122/255).opacity(0.3)
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(width: 220, height: 60)
                            .blur(radius: pulseAnimation ? 15 : 8)

                        // Main button
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
                            .frame(width: 200, height: 55)

                        Text("Continue")
                            .font(.system(size: 22, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                    }
                    .scaleEffect(pulseAnimation ? 1.08 : 1.0)
                    .opacity(pulseAnimation ? 1.0 : 0.9)
                }
                .padding(.bottom, 100)
                .onAppear {
                    withAnimation(
                        Animation.easeInOut(duration: 1.2)
                            .repeatForever(autoreverses: true)
                    ) {
                        pulseAnimation = true
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showNextScreen) {
            if disclaimerAccepted {
                ContentView()
            } else {
                DisclaimerView()
            }
        }
    }
}

#Preview {
    LogoView()
}

#Preview("Alternative") {
    LogoViewAlternative()
}