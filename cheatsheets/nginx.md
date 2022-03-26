# Nginx Cheat Sheet

(from Understanding Nginx Server and Location Block Selection Algorithms - https://goo.gl/YyzshP)

* [Alphabetical index of directives](http://nginx.org/en/docs/dirindex.html)
* [Alphabetical index of variables](http://nginx.org/en/docs/varindex.html)
* [Documentation](http://nginx.org/en/docs/)

```
server {
	location {

	}
}
```

## Blocks: server

Priority

1. listen
2. server_name

### Directives: listen

The *listen* directive can be set to:

* An IP address/port combo.
* A lone IP address which will then listen on the default port 80.
* A lone port which will listen to every interface on that port.
* The path to a Unix socket.

When "incomplete" listen directives

* A block with no listen directive uses the value 0.0.0.0:80.
* A block set to an IP address 111.111.111.111 with no port becomes 111.111.111.111:80
* A block set to port 8888 with no IP address becomes 0.0.0.0:8888

#### Options: default_server

```
server {
    listen      80 default_server;
    server_name example.net www.example.net;
    ...
}
```

### Directives: server_name

Nginx evaluates these by using the following formula:

* Nginx will first try to find a server block with a server_name that matches the value in the "Host" header of the request exactly.
* Find a server block with a server_name that matches using a leading wildcard (indicated by a * at the beginning of the name in the config).
* If no match is found using a leading wildcard, Nginx then looks for a server block with a server_name that matches using a trailing wildcard (indicated by a server name ending with a * in the config).
* If no match is found using a trailing wildcard, Nginx then evaluates server blocks that define the server_name using regular expressions (indicated by a ~ before the name). 
* If no regular expression match is found, Nginx then selects the default server block for that IP address and port.

```
server {
    listen 80;
    server_name example.com;
    ...
}
server {
    listen 80;
    server_name ~^(www|host1).*\.example\.com$;
    ...
}
server {
    listen 80;
    server_name ~^(subdomain|set|www|host1).*\.example\.com$;
    ...
}
server {
    listen 80;
    server_name  ~^(?<user>.+)\.example\.net$;
    ...
}
```

## Blocks: location

```
location optional_modifier location_match {
	...
}
```

### Options: optional_modifier

* (none): The location is interpreted as a prefix match. This means that the location given will be matched against the beginning of the request URI to determine a match.
* =: This block will be considered a match if the request URI exactly matches the location given.
* ~: This location will be interpreted as a **case-sensitive** regular expression match.
* ~*: The location block will be interpreted as a **case-insensitive** regular expression match.
* ^~: If this block is selected as the best non-regular expression match, regular expression matching will not take place.

### Directives: index

```
index index.$geo.html index.0.html /index.html;
autoindex on | off;
```

### Directives:  try_files

```
root /var/www/main;
try_files $uri $uri.html $uri/ /fallback/index.html;
```

If a request is made for /blahblah, the first location will initially get the request. It will try to find a file called blahblah in /var/www/main directory. If it cannot find one, it will follow up by searching for a file called blahblah.html.

### Directives:  rewrite

```
rewrite ^/rewriteme/(.*)$ /$1 last;
```

A request for /rewriteme/hello will be handled initially by the first location block. It will be rewritten to /hello and a location will be searched.

### Directives:  error_page

```
error_page 404             /404.html;
error_page 500 502 503 504 /50x.html;
```

------

## Examples

### A simple PHP site configuration

```
server {
    listen      80;
    server_name example.org www.example.org;
    root        /data/www;

    location / {
        index   index.html index.php;
    }

    location ~* \.(gif|jpg|png)$ {
        expires 30d;
    }

    location ~ \.php$ {
        fastcgi_pass  localhost:9000;
        fastcgi_param SCRIPT_FILENAME
                      $document_root$fastcgi_script_name;
        include       fastcgi_params;
    }
}
```

### App server (Redmine)

```
server {
    listen 80;
    server_name 107.170.165.117 myproject.com www.myproject.com;

    root /srv/redmine/public;
    passenger_enabled on;

    client_max_body_size 10m;
}
```

### App server (Jenkins)

```
upstream app_server {
    server 127.0.0.1:8080 fail_timeout=0;
}

server {
    listen 80;
    listen [::]:80 default ipv6only=on;
    server_name ci.yourcompany.com;

    location / {
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_redirect off;

        if (!-f $request_filename) {
            proxy_pass http://app_server;
            break;
        }
    }
}
```
