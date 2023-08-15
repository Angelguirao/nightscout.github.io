#!/bin/bash
######################################################################################################
#
#  Nightscout in Fly.io Scripted Deployment
#
######################################################################################################
git clone https://github.com/nightscout/cgm-remote-monitor;cd cgm-remote-monitor;cat > fly.toml << "EOF"
app = "nightscout"
kill_signal = "SIGINT"
kill_timeout = 5
processes = []
[experimental]
  allowed_public_ports = []
  auto_rollback = true
[[services]]
  http_checks = []
  internal_port = 1337
  processes = ["app"]
  protocol = "tcp"
  script_checks = []
  [services.concurrency]
    hard_limit = 25
    soft_limit = 20
    type = "connections"
  [[services.ports]]
    force_https = true
    handlers = ["http"]
    port = 80
  [[services.ports]]
    handlers = ["tls", "http"]
    port = 443
  [[services.tcp_checks]]
    grace_period = "1s"
    interval = "15s"
    restart_limit = 0
    timeout = "2s"
EOF
