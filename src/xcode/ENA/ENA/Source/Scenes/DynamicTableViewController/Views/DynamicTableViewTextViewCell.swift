//
// Corona-Warn-App
//
// SAP SE and all other contributors
// copyright owners license this file to you under the Apache
// License, Version 2.0 (the "License"); you may not use this
// file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.
//

import Foundation
import UIKit

class DynamicTableViewTextViewCell: UITableViewCell, DynamicTableViewTextCell {
	let textView = UITextView()

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setup()
	}

	private func setup() {
		selectionStyle = .none
		backgroundColor = .enaColor(for: .background)

		textView.translatesAutoresizingMaskIntoConstraints = false
		textView.isScrollEnabled = false
		textView.dataDetectorTypes = .all
		textView.isEditable = false

		contentView.addSubview(textView)
		contentView.layoutMarginsGuide.topAnchor.constraint(equalTo: textView.topAnchor).isActive = true
		contentView.layoutMarginsGuide.bottomAnchor.constraint(equalTo: textView.bottomAnchor).isActive = true
		contentView.layoutMarginsGuide.leadingAnchor.constraint(equalTo: textView.leadingAnchor).isActive = true
		contentView.layoutMarginsGuide.trailingAnchor.constraint(equalTo: textView.trailingAnchor).isActive = true
	}

	override func prepareForReuse() {
		super.prepareForReuse()

		resetMargins()
		configureDynamicType()
		configure(text: "", color: .enaColor(for: .textPrimary1))
	}

	private func resetMargins() {
		contentView.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
		contentView.insetsLayoutMarginsFromSafeArea = false
	}

	func configureDynamicType(size: CGFloat = 17, weight: UIFont.Weight = .regular, style: UIFont.TextStyle = .body) {
		textView.font = UIFont.preferredFont(forTextStyle: style).scaledFont(size: size, weight: weight)
		textView.adjustsFontForContentSizeCategory = true
	}

	func configure(text: String, color: UIColor? = nil) {
		textView.text = text
		textView.textColor = color ?? .enaColor(for: .textPrimary1)
	}

	func configureAccessibility(label: String? = nil, identifier: String? = nil, traits: UIAccessibilityTraits = .staticText) {
		textView.accessibilityLabel = label
		textView.accessibilityIdentifier = identifier
		accessibilityTraits = traits
	}
}
