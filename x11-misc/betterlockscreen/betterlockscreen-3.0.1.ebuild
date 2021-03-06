# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit systemd

DESCRIPTION="sweet looking lockscreen for linux system - i3lock"
HOMEPAGE="https://github.com/pavanjadhaw/betterlockscreen"
SRC_URI="https://github.com/pavanjadhaw/${PN}/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="systemd"

DEPEND="
	x11-misc/i3lock-color
	media-gfx/imagemagick[-q8,-q32]
	x11-apps/xdpyinfo
	x11-apps/xrandr
	sys-devel/bc
	media-gfx/feh
"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}"

src_install() {
	dobin betterlockscreen
	if use systemd; then
		systemd_dounit "${S}/${PN}@.service"
	fi
}
