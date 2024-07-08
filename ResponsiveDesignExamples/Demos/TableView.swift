//
//  TableView.swift
//  ResponsiveDesignExamples
//
//  Created by Dan Wood on 6/28/24.
//

import SwiftUI

struct Customer: Identifiable, Comparable {
	static func < (lhs: Customer, rhs: Customer) -> Bool {
		lhs.name < rhs.name
	}

	let id = UUID()
	let name: String
	let email: String
	let creationDate: Date
}

struct TableView: View {

#if os(iOS)
	@Environment(\.horizontalSizeClass) private var horizontalSizeClass
	@Environment(\.verticalSizeClass) private var verticalSizeClass
	private var isCompact: Bool { horizontalSizeClass == .compact }
#else
	private let isCompact = false
#endif
	@Environment(\.deviceIsCompact) var deviceIsCompact

	@State var customers: [Customer] = [
		Customer(name: "Aisha Hassan", email: "aisha.hassan@gmail.com", creationDate: Date()),
		Customer(name: "Carlos Gonzalez", email: "carlos.gonzalez@yahoo.com", creationDate: Date()),
		Customer(name: "Wei Zhang", email: "wei.zhang@outlook.com", creationDate: Date()),
		Customer(name: "Priya Sharma", email: "priya@icloud.com", creationDate: Date()),
		Customer(name: "Liam O'Sullivan", email: "liam.osullivan@antiochcollege.edu", creationDate: Date()),
		Customer(name: "Yuki Tanaka", email: "yuki.tanaka@berkeley.edu", creationDate: Date()),
		Customer(name: "Amara Okafor", email: "amara.okafor@nyu.edu", creationDate: Date()),
		Customer(name: "Elena Petrov", email: "elena.petrov@gmail.com", creationDate: Date()),
		Customer(name: "Fatima Al-Mansouri", email: "fatima.almansouri@yahoo.com", creationDate: Date()),
		Customer(name: "Javier Martinez", email: "javier.martinez@outlook.com", creationDate: Date())
	]

#if os(iOS)
	let iPhone = UIDevice.current.userInterfaceIdiom == .phone
#else
	let iPhone = false
#endif

	var body: some View {
		GeometryReader { geo in
			Table(customers) {
				TableColumn("name") { customer in

					// We only get one table column shown when iOS horizontalSizeClass == .compact
					// OR on iPhone, **even if compact** [as of June 2024, reported FB14115052].
					// We also mimick the compact size class behavior on MacOS, which would normally
					// show all columns even if the view is narrow! So use our 'deviceIsCompact' instead.
					//
					// To take advantage of the wide width of a large iphone landscape,
					// Make our own pseudo-columns using HStack.

					if deviceIsCompact || iPhone {

						// Show in two pseudo-columns if there is room for a 400-pixel wide name field
						ViewThatFits(in: .horizontal) {
							HStack {
								Text(customer.name)
									.frame(width: 400, alignment: .leading)
								Text(customer.email)
									.foregroundStyle(.secondary)
							}
							VStack(alignment: .leading) {
								Text(customer.name)
								Text(customer.email)
									.foregroundStyle(.secondary)
							}
						}
					} else {
						Text(customer.name)
					}
				}

				// Use the same logic as above -
				// if we are showing only a single column, don't include subsequent ones.
				if !(deviceIsCompact || iPhone) {
					TableColumn("email", value: \.email)

					TableColumn("joined at") { customer in
						Text(customer.creationDate, style: .date)
					}
				}
			}
		}
	}
}

#Preview {
	TableView()
}
