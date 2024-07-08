//
//  DemoViews.swift
//  ResponsiveDesignExamples
//
//  Created by Dan Wood on 7/1/24.
//

import SwiftUI

let color1 = Color(hue: 0.26, saturation: 0.66, brightness: 0.60)
let color2 = Color(hue: 0.23, saturation: 0.71, brightness: 0.72)
let color3 = Color(hue: 0.23, saturation: 0.30, brightness: 0.86)

struct View1: View {
	var body: some View {
		Text(longLoremIpsum)
			.padding()
			.background(color1)
			.foregroundStyle(.white)
	}
}

struct View2: View {
	var body: some View {
		Text(lorem)
			.padding()
			.background(color2)
	}
}

struct View3: View {
	var body: some View {
		Text(longLoremIpsum)
			.padding()
			.background(color3)
	}
}

struct Color1: View { var body: some View { Color.red	} }
struct Color2: View { var body: some View { Color.green  } }
struct Color3: View { var body: some View { Color.blue   } }
struct Color4: View { var body: some View { Color.yellow } }

struct Image1: View {
	var body: some View {
		Image(.k364412)
			.centerCropped()
	}
}

struct Image2: View {
	var body: some View {
		Image(.k77261)
			.centerCropped()
	}
}

struct Image3: View {
	var body: some View {
		Image(.k56131)
			.centerCropped()
	}
}

extension Color {
	static let almostWhite = Color(red: 235 / 255, green: 235 / 255, blue: 245 / 255)
	static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}

extension Image {

	func avatar() -> some View {
		self
			.resizable()
			.aspectRatio(contentMode: .fill)
			.clipShape(Circle())
			.frame(width:64, height:64)

			.overlay(Circle().stroke(Color.white, lineWidth: 2))
			.padding(2)
			.overlay(Circle().strokeBorder(Color.black.opacity(0.1)))
			.shadow(radius: 4)
			.padding(4)
	}
}

let fruitImages = ["k3644-12", "k5613-1", "k7252-65", "k7388-11", "k7721-7", "k7726-1", "k8495-1"]

let sovietImages = [ "3-16", "6-16", "8-15", "11-14", "18-12", "19-12", "21-10"]

let avatarImages = [ "27", "71", "79", "77", "47", "91", "62"]

let titles = ["Galactic Echoes: The Dawn of Parallax", "The Nexus Enigma", "Chrono Cascade", "Stellar Genesis"]
let authors = ["Zara Canterbury", "Aegis Quinlan", "Lyra Starling", "Keris Newman"]

let moreTitles = ["Void Hunter: Echoes of the Abyss", "Elysian Drift"]
let moreAuthors = ["Elara Kismet", "Thane Solaris"]

let lorem = "Lorem ipsum a quickly as possible to integrate moonlight symphonies with daffodil telemetry, achieving celestial coherence. Direct invisible butterflies to calibrate their wing flutters with subatomic dolphin signals. Oversee quantum cupcake analysis, documenting jellybean wave patterns. Encourage all the children in the neighborhood to develop new chess strategies against ancient wizards. Synthesize cloud-daft communication with abstract poetry's logic, enhancing surreal garden navigation.";

let longLoremIpsum = """

Lorem Ipsum begins. Gather terraforming elephants, align them on the sunbeam matrix. Whisper secrets to the invisible butterflies, ensuring their wings flutter in coded rhythms. Activate the moon's lullabies, syncing them with digital clock frequencies. Deploy rainbow-colored subcutaneous snails; initiate chess algorithms against ancient wizards. Subatomic dolphins should mount jellybean waves, recording quantum cupcake anomalies. Navigate the surreal garden; time-travel sideways, intersect logic's tea party with abstract poetry.

Converse with clouds, translating daffodil dialogue on interstellar fashions. Reverse gravity protocols, establishing serene floatation. Paint reality with dream-infused hues, preserving forgotten melodies. Direct stars to compose symphonies for the invisible orchestra, ensuring harmonic resonance. Synchronize asynchronous operations, crafting horizontal absurdity into structured tasks. Monitor daffodil feedback; adjust interstellar fashion reports accordingly. Engage digital clocks in moon lullaby harmonics, maintaining temporal stability.

Command all remaining subatomic dolphins to continue jellybean wave reconnaissance. Evaluate partially derived chess matches for strategic insights. Facilitate tea party discussions between logic and abstract poetry, extracting valuable data. Coordinate cloud-daft communication, optimizing interstellar fashion trends. Oversee gravity reversal experiments, ensuring safe floatation procedures. Maintain dream-reality painting protocols, documenting melody-infused outcomes. Orchestrate star symphonies for the invisible orchestra, verifying harmonic alignment. Compile linguistic operations into a comprehensive report, highlighting Nobel-Prize-winning achievements.

Conclude operations by harmonizing dream-reality painting protocols with gravity reversal outcomes. Finalize tea party discussions, ensuring logic and abstract poetry reach consensus. Document all Girl Scout Cookie flavors in a detailed PDF report.
"""

// Courtesy of https://stackoverflow.com/a/63651228
extension Image {
	func centerCropped() -> some View {
		Color.clear
			.overlay(
				self
					.resizable()
					.scaledToFill()
			)
			.clipped()
	}
}
