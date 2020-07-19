iostat -yc -o JSON 1 1 | jq '.sysstat.hosts[0].statistics[0]["avg-cpu"].iowait'
