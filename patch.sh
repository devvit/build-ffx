#

echo '
ac_add_options --with-branding=browser/branding/unofficial
# ac_add_options --with-app-name=icecat
# ac_add_options --with-app-basename=Icecat
# ac_add_options --with-distribution-id=org.gnu

ac_add_options --without-wasm-sandboxed-libraries

ac_add_options --disable-updater
ac_add_options --disable-tests
ac_add_options --disable-crashreporter
ac_add_options --disable-profiling
ac_add_options --disable-jprof
ac_add_options --disable-dmd
ac_add_options --disable-geckodriver
# ac_add_options --disable-webrtc
ac_add_options --disable-debug
ac_add_options --disable-debug-symbols
ac_add_options --disable-eme
ac_add_options --disable-warnings-as-errors

# ac_add_options --enable-bootstrap
# ac_add_options --enable-lto

MOZ_REQUIRE_SIGNING=
MOZ_DATA_REPORTING=
MOZ_TELEMETRY_REPORTING=

# export MOZ_LTO=cross
' >mozconfig

if [[ "$(uname -s)" == "Darwin" ]]; then
    # echo 'ac_add_options --with-macbundlename-prefix=Icecat' >>mozconfig
    echo
elif [[ "$(uname -s)" == "Linux" ]]; then
    echo 'ac_add_options --disable-jemalloc' >>mozconfig
    echo 'ac_add_options --disable-elf-hack' >>mozconfig
else
    echo 'ac_add_options --disable-maintenance-service' >>mozconfig
    echo 'ac_add_options --enable-lto' >>mozconfig
    echo 'export MOZ_LTO=cross' >>mozconfig
fi

perl -pi -e 's/debuggerStatement\(\) {/debuggerStatement\(\) {return null\(\);/g' ./js/src/frontend/Parser.cpp
