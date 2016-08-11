# kimsufi-availability

Small bash script for check kimsufi availability and notify by telegram

## Get kimsufi-availability

```
$ git clone https://github.com/cl3m3nt666/kimsufi-availability.git
```
## How to use

Set env value in docker-compose.yml with server.json :

* SERVER_WARN :  "SoYouStart - SYS-IP-6" = 142sys7

* ZONE :  geographical zones

* TOKEN : telegram token, contact @botfather

* USERID : telegram id, contact @myidbot

```
environment:
  SERVER_WARN: 143sys1
  ZONE: rbx
  TOKEN:
  USERID:
```

## How to run

* With docker-compose

```
$ docker-compose up --build -d
```

* With Dockerfile

Build :
```
$ docker build -t kimsufi .
```

Run :

```
$ docker run -it -d -e SERVER_WARN=143sys1 -e ZONE=rbx -e TOKEN= -e USERID= kimsufi
```

Check every the 2min.


## When your server is found

Telegram message :

```
References / zones available :
 - '143sys1' 'rbx' is available: '1H-high'
 - '143sys10' 'rbx' is available: '1H-high'
 - '143sys11' 'rbx' is available: '1H-high'
 - '143sys13' 'rbx' is available: '1H-low'
```
