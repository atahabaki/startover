let-env config = {
	show_banner: false
	cd: {
		abbreviations: true
	}
	table: {
		trim: {
			methodology: truncating
			truncating_suffix: "\u{2026}"
		}
	}
	history: {
		max_size: 10000,
		file_format: "sqlite"
	}
	completions: {
		algorithm: fuzzy
	}
}

source ~/.config/broot/launcher/nushell/br
source ~/.config/nushell/alias.nu
source ~/.config/nushell/zoxide.nu
