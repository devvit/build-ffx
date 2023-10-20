#

perl -pi -e 's/debuggerStatement\(\) {/debuggerStatement\(\) {return null\(\);/g' ./js/src/frontend/Parser.cpp
