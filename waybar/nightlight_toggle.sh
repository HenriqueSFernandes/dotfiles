if pgrep -x "redshift" > /dev/null; then
	pkill redshift
else
  redshift -O 3500
fi
