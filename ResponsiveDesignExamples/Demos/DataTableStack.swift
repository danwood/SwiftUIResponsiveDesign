//
//  DataTableStack.swift
//  Responsive Layouts
//
//  Created by Dan Wood on 7/18/20.
//
// https://responsivedesign.is/patterns/data-table-stack/

import SwiftUI

struct Movie: Codable, Identifiable {
	let id = UUID()
	var title: String
	var rank : Int
	var year : Int
	var rating : Int		// Percent
	var genre : String

	private enum CodingKeys: String, CodingKey {
		case title, rank, year, rating, genre
	}

}

struct DataTableStack: View {

	let spacing: CGFloat = 20.0

	let movies = Bundle.main.decode([Movie].self, from: "moviedata.json")
	let gridKeyValue : [GridItem] = Array(repeating: .init(.flexible(), spacing:20), count: 2)	// spacing is horizontal here

	var body: some View {

		MyViewThatFits(in: .horizontal, useMinSize: true) {

			Table(movies) {
				TableColumn("Title", value: \.title)
				TableColumn("Rank") { movie in
					Text("\(movie.rank)")
				}
				TableColumn("Year") { movie in
					Text("\(movie.year, format: .number.grouping(.never))")
				}
				TableColumn("Rating") { movie in
					Text("\(movie.rating)%")
				}
				TableColumn("Genre", value: \.genre)
			}
			.frame(minWidth: 600)

			List {
				ForEach(movies) { movie in

					Section() {
						LabeledContent("Title") {
							Text("\(movie.title)")
						}
						LabeledContent("Rank") {
							Text("\(movie.rank)")
						}
						LabeledContent("Year") {
							Text("\(movie.year, format: .number.grouping(.never))")
						}

						LabeledContent("Rating") {
							Text("\(movie.rating)%")
						}

						LabeledContent("Genre") {
							Text("\(movie.genre)")
						}
					}
				}
			}
			.frame(minWidth: 300)

			// Smallest layout really only needed for very small screens

			List {

				ForEach(movies) { movie in

					Section() {
						Text("Title").font(.caption).foregroundStyle(.secondary).listRowSeparator(.hidden)
						Text("\(movie.title)")

						Text("Rank").font(.caption).foregroundStyle(.secondary).listRowSeparator(.hidden)
						Text("\(movie.rank)")

						Text("Year").font(.caption).foregroundStyle(.secondary).listRowSeparator(.hidden)
						Text("\(movie.year, format: .number.grouping(.never))")

						Text("Rating").font(.caption).foregroundStyle(.secondary).listRowSeparator(.hidden)
						Text("\(movie.rating)%")

						Text("Genre").font(.caption).foregroundStyle(.secondary).listRowSeparator(.hidden)
						Text("\(movie.genre)")
					}
					.listRowSeparator(.hidden)
				}
			}
			.padding()
		}
	}
}
