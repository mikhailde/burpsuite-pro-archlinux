# Maintainer: mikhailde
# Contributor: xiv3r (for original scripts/loader concept)
# Contributor: h3110w0r1d-y (for BurpLoaderKeygen)

pkgname=burpsuite-professional
_burp_display_version="2025.4.2"
pkgver=${_burp_display_version}
pkgrel=1
pkgdesc="Burp Suite Professional for Arch Linux (community maintained, requires loader)"
arch=('any')
url="https://portswigger.net/burp/pro"
license=('custom:Proprietary::BurpSuitePro' 'MIT::Loader' 'MIT::PKGBUILD_and_Scripts')
depends=('java-runtime-openjdk>=21' 'java-environment-openjdk>=21')
optdepends=('jre-openjdk-headless: for running without GUI (if applicable to loader/activation)')
source=(
  "burpsuite_pro_latest.jar::https://portswigger-cdn.net/burp/releases/download?product=pro&type=Jar"
  "loader.jar"
  "burp_suite.ico"
  "${pkgname}.desktop"
  "${pkgname}.sh"
  "${pkgname}.install"
)
sha256sums=('3695aaadd51ac4fbd4e0ed8ca652d345f9ea381db20bfcd0271ee8f6cb632825'
            'dcdf28acf360554a5a98d78f403c96ccea500be24b27d02b020e142820637c0a'
            '7ae3e5b9292a92c750eadcb7b272202b043c401eee2837aa7a775c41700c361c'
            'b52c392663ebadf1231c6a26222027cdbaef30dfbeef694c5a5aabf658a66797'
            '4c325680fbc89f73f5072972d40852962d50ce2860ad066ae094ac56ef018cc9'
            '43e4e5cd679fef913759c7cdbbca66dba32488a1259fd38ea00e7476a1d8b795')

install=${pkgname}.install

package() {
  cd "$srcdir"

  install -dm755 "${pkgdir}/opt/${pkgname}"
  install -m644 "burpsuite_pro_latest.jar" "${pkgdir}/opt/${pkgname}/burpsuite_pro.jar"
  install -m644 "loader.jar" "${pkgdir}/opt/${pkgname}/loader.jar"

  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  sed -i "s|__INSTALL_DIR__|/opt/${pkgname}|g" "${pkgdir}/usr/bin/${pkgname}"
  sed -i "s|__PKG_NAME__|${pkgname}|g" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i "s|__EXEC_PATH__|/usr/bin/${pkgname}|g" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i "s|__ICON_NAME__|${pkgname}|g" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i "s|__PKG_NAME_PRETTY__|Burp Suite Professional|g" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 "burp_suite.ico" "${pkgdir}/usr/share/pixmaps/${pkgname}.ico"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_BurpSuitePro" <<EOF
Burp Suite Professional is proprietary software owned by PortSwigger Ltd.
This Arch Linux package is community-maintained and facilitates installation.
Use of this software is subject to PortSwigger's End User License Agreement (EULA).
This package may include or require third-party components to enable all features;
refer to the source repository's README for details on licensing and usage.
Purchasing an official license is recommended for commercial or production use.
EOF

  cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_Loader" <<EOF
The 'loader.jar' component, if used, is typically sourced from projects like
h3110w0r1d-y/BurpLoaderKeygen, often provided under the MIT License.

MIT License (Example - verify actual license of your loader.jar)

Copyright (c) <Year> <Loader Author>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Note: The use of such a loader may violate Burp Suite's EULA.
EOF

  cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_PKGBUILD_and_Scripts" <<EOF
MIT License

Copyright (c) $(date +%Y) $(grep -m1 "Maintainer:" PKGBUILD | awk -F'Maintainer: ' '{print $2}')

Permission is hereby granted, free of charge, to any person obtaining a copy
of this PKGBUILD and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
}
