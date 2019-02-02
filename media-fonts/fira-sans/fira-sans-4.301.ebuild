# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit font eapi7-ver

DESCRIPTION="Default typeface for FirefoxOS, designed for legibility"
HOMEPAGE="https://bboxtype.com/typefaces/FiraSans/"
SRC_URI="https://bboxtype.com/downloads/Fira/Download_Folder_FiraSans_$(ver_cut 1)$(ver_cut 2).zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE="doc"

DEPEND="app-arch/unzip"

FONT_SUFFIX="otf"
S="${WORKDIR}/Download_Folder_FiraSans_$(ver_cut 1)$(ver_cut 2)/"
DOCS="Fira_*_Change_Log.rtf"

pkg_setup() {
	FONTDIR_BIN=(
		Fonts/Fira_Sans_{OTF,WEB}_$(ver_cut 1)$(ver_cut 2)/{Compressed,Condensed,Normal}/{Roman,Italic}
	)
	use doc && DOCS+=" *PDF/*.pdf"
	FONT_S=( "${FONTDIR_BIN[@]}" )
	[[ -e "${EROOT}/${FONTDIR}/fonts.cache-1" ]] && rm -f "${EROOT}/${FONTDIR}/fonts.cache-1"

	local _t
	for _t in ${MY_FONT_TYPES[@]/*_}; do
		use font_types_${_t} && FONT_SUFFIX+=" ${_t}"
	done
	FONT_SUFFIX=${FONT_SUFFIX:-otf}
}
