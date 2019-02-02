# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit font

DESCRIPTION="Default monospaced typeface for FirefoxOS, designed for legibility"
HOMEPAGE="https://bboxtype.com/typefaces/FiraSans/"
SRC_URI="https://bboxtype.com/downloads/Fira/Fira_Mono_3_2.zip -> Fira_Mono_3.206.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 "
IUSE=""

DEPEND="app-arch/unzip"

S="${WORKDIR}/Fira_Mono_3_2"
FONT_S="${S}/Fonts/FiraMono_OTF_32"
FONT_SUFFIX="otf"
