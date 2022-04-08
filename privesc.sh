#!/bin/bash

#suid perms
chmod u+s /bin/chown
chmod u+s /usr/bin/awk

#adding vulnerable crontab
echo "*/2 * * * * root /home/luke_skywalker/run.sh" > /etc/crontab
echo -e "#!/bin/bash\n\nprintf 'hello'" > /home/luke_skywalker/run.sh
chmod 777 /home/luke_skywalker/run.sh

#vulnerable path in script
echo -e "#!/bin/bash\n\necho'testing internet'\ncurl -I http://google.com" > /home/luke_skywalker/internet.sh
chown root /home/luke_skywalker/internet.sh
chmod 555 /home/luke_skywalker/internet.sh
chmod u+s /home/luke_skywalker/internet.sh
