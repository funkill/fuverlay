EAPI=4
inherit eutils

HOMEPAGE="https://www.jetbrains.com/datagrip/"
DESCRIPTION="Smart SQL Editor and Advanced Database Client by JetBrains"
SRC_URI="https://download.jetbrains.com/datagrip/datagrip-${PV}-custom-jdk-linux.tar.gz"

if [[ x${PVERSION} != 'x' ]]; then
	KEYWORDS="x86 amd64"
else
	KEYWORDS="~x86 ~amd64"
fi

PROGNAME="DataGrip"

RESTRICT="strip mirror"
DEPEND=">=virtual/jre-1.6"
SLOT="0"
S=${WORKDIR}

src_install() {
	dodir /opt/${PN}

	cd DataGrip*/
	sed -i 's/IS_EAP="true"/IS_EAP="false"/' bin/datagrip.sh
	insinto /opt/${PN}
	doins -r *

	fperms a+x /opt/${PN}/bin/datagrip.sh || die "Chmod failed"
	fperms a+x /opt/${PN}/bin/fsnotifier || die "Chmod failed"
	fperms a+x /opt/${PN}/bin/fsnotifier64 || die "Chmod failed"
	dosym /opt/${PN}/bin/datagrip.sh /usr/bin/${PN}
	
	newicon "bin/product.png" datagrip.png
	make_desktop_entry ${PN} "${PROGNAME}" "${PN}"
}

pkg_postinst() {
    elog "Run /usr/bin/${PN}"
}


