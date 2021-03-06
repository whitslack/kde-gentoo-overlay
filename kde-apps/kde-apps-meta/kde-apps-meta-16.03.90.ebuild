# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit kde5-meta-pkg

DESCRIPTION="Meta package for the KDE Applications collection"
KEYWORDS=" ~amd64 ~x86"
IUSE="accessibility minimal nls pim sdk"

[[ ${KDE_BUILD_TYPE} = live ]] && L10N_MINIMAL=${KDE_APPS_MINIMAL}

RDEPEND="
	$(add_kdeapps_dep kate)
	$(add_kdeapps_dep kdeadmin-meta)
	$(add_kdeapps_dep kdecore-meta)
	$(add_kdeapps_dep kdeedu-meta)
	$(add_kdeapps_dep kdegames-meta)
	$(add_kdeapps_dep kdegraphics-meta)
	$(add_kdeapps_dep kdemultimedia-meta)
	$(add_kdeapps_dep kdenetwork-meta)
	$(add_kdeapps_dep kdetoys-meta '' 15.08.3)
	$(add_kdeapps_dep kdeutils-meta)
	accessibility? ( $(add_kdeapps_dep kdeaccessibility-meta '' 15.12.3) )
	nls? (
		$(add_kdeapps_dep kde-l10n '' ${L10N_MINIMAL})
		$(add_kdeapps_dep kde4-l10n 'minimal' ${L10N_MINIMAL})
	)
	pim? ( $(add_kdeapps_dep kdepim-meta) )
	sdk? (
		$(add_kdeapps_dep kdesdk-meta)
		$(add_kdeapps_dep kdewebdev-meta '' 15.08.3)
	)
	!minimal? ( $(add_kdeapps_dep kdeartwork-meta '' 15.08.3) )
"
