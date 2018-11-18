# activemq-docker
[![](https://images.microbadger.com/badges/image/openkbs/activemq-docker.svg)](https://microbadger.com/images/openkbs/activemq-docker "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/openkbs/activemq-docker.svg)](https://microbadger.com/images/openkbs/activemq-docker "Get your own version badge on microbadger.com")

* ActiveMQ + Java 8 JDK + Maven 3.5 + Python 3.5 + Gradle

# NOTE: This docker default is providing latest Eclipse Photon instead of Oxygen and you can change it to build other versions!!!

# License Agreement
By using this image, you agree the [Oracle Java JDK License](http://www.oracle.com/technetwork/java/javase/terms/license/index.html).
This image contains [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/index.html). You must accept the [Oracle Binary Code License Agreement for Java SE](http://www.oracle.com/technetwork/java/javase/terms/license/index.html) to use this image.

# Components
* java version "1.8.0_191"
  Java(TM) SE Runtime Environment (build 1.8.0_191-b12)
  Java HotSpot(TM) 64-Bit Server VM (build 25.191-b12, mixed mode)
* Apache Maven 3.5.3
* Python 3.5.2
* Gradle 4.9
* Other tools: git wget unzip vim python python-setuptools python-dev python-numpy 

# Run (recommended for easy-start)
Image is pulling from openkbs/activemq-docker
```
./run.sh
```

# Build
You can build your own image locally.
```
./build.sh
```

# Related 
* [openkbs/activemq-docker](https://hub.docker.com/r/openkbs/activemq-docker/)
* [openkbs/mysql-workbench](https://hub.docker.com/r/openkbs/mysql-workbench/)
* [openkbs/pgadmin-docker](https://hub.docker.com/r/openkbs/pgadmin-docker/)

# References
* [ActiveMQ - Starting](http://activemq.apache.org/version-5-getting-started.html#Version5GettingStarted-StartingActiveMQStartingActiveMQ)
* [SSL Transport](http://activemq.apache.org/ssl-transport-reference.html)
* [ActiveMQ Examples](http://activemq.apache.org/examples.html)
