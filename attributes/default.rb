default[:bind9][:data_path] =  "/var/named"
default[:bind9][:enable_ipv6] = true
default[:bind9][:allow_query] = nil
default[:bind9][:allow_recursion] = "none"

default[:bind9][:recursion] = "yes"
default[:bind9][:pidfile] = "/var/run/named/named.pid"
default[:bind9][:dump_file] = "/var/named/data/cache_dump.db";
default[:bind9][:statistics_file] = "/var/named/data/named_stats.txt";
default[:bind9][:memstatistics_file] = "/var/named/data/named_mem_stats.txt";

default[:bind9][:config_path] = "/etc/named"
default[:bind9][:config_file] = "named.conf"
default[:bind9][:user] = "named"
