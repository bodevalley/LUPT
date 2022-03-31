#!/bin/bash

chown root:root /etc/anacrontab
chmod 400 /etc/anacrontab
chown root:root /etc/crontab
chmod 400 /etc/crontab
chown root:root /etc/cron.hourly
chmod 400 /etc/cron.hourly
chown root:root /etc/cron.daily
chmod 400 /etc/cron.daily
chown root:root /etc/cron.weekly
chmod 400 /etc/cron.weekly
chown root:root /etc/cron.monthly
chmod 400 /etc/cron.monthly
chown root:root /etc/cron.d
chmod 400 /etc/cron.d

chown root:root <crontabfile>
chmod 400 <crontabfile>

chmod 644 /etc/passwd
chown root:root /etc/passwd

chmod 644 /etc/group
chown root:root /etc/group

chmod 600 /etc/shadow
chown root:root /etc/shadow

chmod 600 /etc/gshadow
chown root:root /etc/gshadow
