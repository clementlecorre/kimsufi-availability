# kimsufi-availability

Small bash script run on docker for check kimsufi availability and notify by telegram

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

* TIMESLEEP : time to check your ovh server (1s)

* TIMERENOTIFY : time to re notify by telegram (every 1min)

```
environment:
  SERVER_WARN: 143sys1
  ZONE: rbx
  TOKEN:
  USERID:
  TIMESLEEP: 1
  TIMERENOTIFY: 60
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
$ docker run -it -d -e SERVER_WARN=143sys1 -e ZONE=rbx -e TOKEN= -e USERID= -e TIMESLEEP=1 -e TIMERENOTIFY=60 kimsufi
```


## When your server is found

Telegram message :

```
Hi, starting search for OVH references and zone availabilities for 143sys1 every 1s ...

References / zones available :
 - '143sys1' 'rbx' is available: '1H-high'
 - '143sys10' 'rbx' is available: '1H-high'
 - '143sys11' 'rbx' is available: '1H-high'
 - '143sys13' 'rbx' is available: '1H-low'
```
