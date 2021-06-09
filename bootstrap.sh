#!/usr/bin/env bash

if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi

## print servers IP address
echo "The IP of the host $(hostname) is $(hostname -I | awk '{print $2}')"

## generate server identified html file
echo "Creating dynamic html page"
cat <<EOF > /var/www/html/$(hostname).html
<html>
<body>
<p>hostname is: $(hostname)</p>
</body>
</html>
EOF

echo "To verify please browse to http://$(hostname -I | awk '{print $2}')/$(hostname).html"
