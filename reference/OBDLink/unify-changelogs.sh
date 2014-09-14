cat *.txt | sort | uniq | perl -pi -e "s/^\-\ /\ \ \*\ /g" > README.md
