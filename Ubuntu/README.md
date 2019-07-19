# Unix warp 10 set-up

## Download Warp_10 jar

This example is build around the Warp10 revision 2.0.2-44. Those scripts works also for the 1.X revision.

```
export WARP10_REVISION = 2.0.2-44
wget https://dl.bintray.com/senx/generic/io/warp10/warp10/$WARP10_REVISION/warp10-$WARP10_REVISION.tar.gz
```

Extract Warp 10 in a new directory

```
mkdir warp10
tar -xvf warp10-$WARP10_REVISION.tar.gz -C warp10
```

## Init Level DB

In the file levelDB_init update the following keys, but don't run it yet, as we have to add a Warp 10 configuration file to execute it. All those keys must match your own environnement: 
WARP10_REVISION: The current warp 10 revision
WARP10_HOME: The path to your local set-up of Warp 10
JAVA_8: The path to your local set-up of Java 8

```
WARP10_REVISION=2.0.2-44
WARP10_HOME=/Path/to/warp10/warp10-$WARP10_REVISION/
JAVA_8=/Path/to/jdk1.8.0_171/bin
```

Then copy the warp10.conf file of this repository into your Warp10 home under the `etc` repository. Update the `standalone.home` entry point of the configuration file to match your own.
```
standalone.home
```

Then give the current user the right to execute the init levelDB script, and start it.
```
chmod u+x chmod u+x warp10-levelDB-init
./warp10-levelDB-init
```

## Create a Warp 10 application and its associated tokens

Your level DB is now ready to start. To create an application and generate custom token, you can use the worf java library included in Warp.
Just update the warp10-worf-generate-token.sh to modify the following variables. Apllication name corresponds to your Warp 10 application: this script will create an application (if it doesn't exists yet) and generate a READ and WRITE token for this application. In our example the test application. TTL corresponds to the time duration (in ms?) where the token is available.

```
APPLICATION_NAME=test
TTL=7776000000
WARP10_REVISION=2.0.2-44
WARP10_HOME=/Path/to/warp10/warp10-$WARP10_REVISION/
JAVA_8=/Path/to/jdk1.8.0_171/bin
```

Then execute it:
```
chmod u+x warp10-worf-generate-token.sh 
./warp10-worf-generate-token.sh
```
This will create a custom token: a READ and WRITE one. Save them somewhere!

## Start Warp 10

Update the following script variables.
Quantum revision is need as its corresponds to a default plugin (that can be deactivated in the conf file). It's an IDE to execute some WarpScript on your navigator. It's revision is specified in the jar folder of your Warp10-home.

```
WARP10_REVISION=2.0.2-44
QUANTUM_REVISION=3.0.3
WARP10_HOME=/Path/to/warp10/warp10-$WARP10_REVISION/
JAVA_8=/Path/to/jdk1.8.0_171/bin
```

And just run the following script
```
chmod u+ warp10-start.sh
./warp10-start.sh
```
Warp 10 is now running, you can shut it down using CTRL + C. The Warp10 backend run at `127.0.0.1:8090` and Quantum IDE at `127.0.0.1:8081`. The URL and the ports can be change according to your need using warp10.conf. Looks for `standalone.host` and `standalone.port` for the Warp10 backend. For the quantum IDE, it's  `quantum.host` and `quantum.port`.

## Query Warp

To launch your first query, open you favorite navigator and go to [Quantum URL](http://127.0.0.1:8081). Click on `Choose another backend`, put your warp10 backend url followed by the "/api/v0" path. In our example, specify **http://127.0.0.1:8090/api/v0** and click on save.

Then put the NOW WarpScript function in the WarpScript editor and click on execute. It should return the UTC current time! To learn more on WarpScript we made a nice tutorial to learn how to explore the NASA dataset to discover exoplanet. This tutorial is available online [here](https://helloexoworld.github.io/hew-hands-on/).
