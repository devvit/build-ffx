#

curl -fsSL https://hg.mozilla.org/mozilla-unified/bookmarks | perl -ne 'printf("%s\n", $&) if /esr(\d+)/' | head -n1
