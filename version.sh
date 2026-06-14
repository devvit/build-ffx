#

# month_num=$(date +%m)
# month=$(expr $month_num % 2)
# if [ $month -eq 0 ]; then
#     curl -fsSL https://api.github.com/repos/mozilla-firefox/firefox/branches | perl -ne 'printf("%s\n", $&) if /esr(\d+)/' | tail -n1
# else
#     curl -fsSL https://api.github.com/repos/mozilla-firefox/firefox/branches | perl -ne 'printf("%s\n", $&) if /esr(\d+)/' | tail -n1
# fi

echo 'esr140'
