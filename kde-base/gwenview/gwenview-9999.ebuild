# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="KDE image viewer"
KEYWORDS=""
IUSE="debug kipi"

# tests hang, last checked for 4.2.96
RESTRICT="test"

DEPEND="
	$(add_kdebase_dep libkonq)
	$(add_kdebase_dep kactivities)
	>=media-gfx/exiv2-0.19
	virtual/jpeg
	kipi? ( $(add_kdebase_dep libkipi) )
"
RDEPEND="${DEPEND}"

KMLOADLIBS="libkonq"

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with kipi)
	)

	kde4-base_src_configure
}

pkg_postinst() {
	kde4-base_pkg_postinst

	if ! has_version kde-base/svgpart:${SLOT} ; then
		elog "For SVG support, install kde-base/svgpart:${SLOT}"
	fi

	if use kipi && ! has_version media-plugins/kipi-plugins ; then
		elog "The plugins for the KIPI inteface can be found in media-plugins/kipi-plugins"
	fi
}
