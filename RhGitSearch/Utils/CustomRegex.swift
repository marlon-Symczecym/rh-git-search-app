//
//  CustomRegex.swift
//  RhGitSearch
//
//  Created by Marlon Symczecym on 06/01/24.
//

import Foundation
import RegexBuilder

class CustomRegex {
	
	static let regex = Regex {
		OneOrMore(.word)
		Optionally {
			ChoiceOf {
				One(.anyOf("-"))
				One(.whitespace)
			}
		}
		OneOrMore(.word)
		Optionally {
			ChoiceOf {
				One(.anyOf("-"))
				One(.whitespace)
			}
		}
		OneOrMore(.word)
		Optionally {
			ChoiceOf {
				One(.anyOf("-"))
				One(.whitespace)
			}
		}
		OneOrMore(.word)
	}

}
