for combo in $(curl -s  https://raw.githubusercontent.com/N3xtbit/vendor_jenkins/n7.1/aicp-{Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,nightly}-targets | sed -e 's/#.*$//' | grep n7.1 | awk {'print $2'})
do
    add_lunch_combo $combo
done
