# hippo-repository-checker-docker
This is the repository tool from Hippo, for easy use

## Volumes
    /usr/local/hippo-addon/checker/storage

## Usage
I encourage to use a file for enviroment variables, looking something like this:
```
DB_HOST=mysql_host
DB_PORT=3306
DB_NAME=hippo
DB_USER=root
DB_PASS=rootPassword
MIN_HEAP=1024
MAX_HEAP=512
EXTRA_JVM_OPTS=
```
And run it like this
```BASH
docker run --env-file [[env-file]] openweb/hippo-repository-checker [command]
```

## Tips and Tricks
### For editing control of the checker.properties, map the file to an empty local file.  
If it is empty, the first run will generate the file for you, ready to adjust.
```BASH
docker run --env-file [[env-file]] -v $(pwd)/checker.properties:/usr/local/hippo-addon/checker/checker.properties openweb/hippo-repository-checker [command]
``` 
### Is your database in a docker container, use the --net flag
``` BASH
docker run --env-file [[env-file]]  --net="[[networkkid-of-mysql]]" openweb/hippo-repository-checker [command]
```
### Want both? then the command is something like this:
```BASH
docker run --env-file [[env-file]] -v $(pwd)/checker.properties:/usr/local/hippo-addon/checker/checker.properties --net="[[networkkid-of-mysql]]" openweb/hippo-repository-checker [command]
``` 
## Want to know the command type? just use no command at all!
```BASH
docker run openweb/hippo-repository-checker
``` 
