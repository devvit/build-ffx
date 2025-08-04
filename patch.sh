#

echo '
ac_add_options --with-branding=browser/branding/unofficial
# ac_add_options --with-app-name=firefox
# ac_add_options --with-app-basename=Firefox
# ac_add_options --with-distribution-id=org.gnu

ac_add_options --without-wasm-sandboxed-libraries

ac_add_options --disable-updater
ac_add_options --disable-tests
ac_add_options --disable-crashreporter
ac_add_options --disable-profiling
ac_add_options --disable-dmd
ac_add_options --disable-geckodriver
# ac_add_options --disable-webrtc
ac_add_options --disable-debug
ac_add_options --disable-debug-symbols
ac_add_options --disable-eme
ac_add_options --disable-warnings-as-errors

# ac_add_options --enable-bootstrap
# ac_add_options --enable-lto

export MOZ_REQUIRE_SIGNING=
export MOZ_DATA_REPORTING=
export MOZ_TELEMETRY_REPORTING=

# export MOZ_LTO=cross
' >mozconfig

# ac_add_options --enable-optimize="-O3 -msse4.1"
# export CFLAGS="-O3 -msse4.1"
# export CPPFLAGS="-O3 -msse4.1"
# export CXXFLAGS="-O3 -msse4.1"
# export LDFLAGS="-Wl,-O3 -msse4.1"
# export RUSTFLAGS="-C target-feature=+sse4.1"

if [[ "$(uname -s)" == "Darwin" ]]; then
    # echo 'ac_add_options --with-macbundlename-prefix=Firefox' >>mozconfig
    echo 'ac_add_options --enable-application=browser' >>mozconfig
    echo 'export CC="$HOME"/.mozbuild/clang/bin/clang' >>mozconfig
    echo 'export CXX="$HOME"/.mozbuild/clang/bin/clang++' >>mozconfig
elif [[ "$(uname -s)" == "Linux" ]]; then
    echo 'ac_add_options --disable-jemalloc' >>mozconfig
    echo 'ac_add_options --disable-elf-hack' >>mozconfig
else
    echo 'ac_add_options --disable-maintenance-service' >>mozconfig
    # echo 'ac_add_options --enable-lto' >>mozconfig
    # echo 'export MOZ_LTO=cross' >>mozconfig
fi

echo $version | tr 'a-z' 'A-Z' | tr -dc 'A-Z-' | xargs -I {} \
    echo "MOZ_APP_DISPLAYNAME='Browser{}'" >./browser/branding/unofficial/configure.sh

# perl -pi -e 's/debuggerStatement\(\) {/debuggerStatement\(\) {return null\(\);/g' ./js/src/frontend/Parser.cpp
perl -pi -e "s/debugger, debugger/debugger$(date +'%Y%m%d%H%M%S'), debugger/g" ./js/src/frontend/ReservedWords.h
perl -pi -e 's/GetMenuAccessKey\(\) {/GetMenuAccessKey\(\) {return 0;/g' widget/nsXPLookAndFeel.cpp
