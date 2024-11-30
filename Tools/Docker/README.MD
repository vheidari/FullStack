# Docker Tools: A Short Explanation
We use Docker to manage all services and applications during development. To use it, we need two tools:`Docker Engine` and `Docker Desktop`.

## Docker Engine :
If you are comfortable with the command line interface (CLI), you can simply install `Docker Engine`. When we install `Docker Engine`, its dependency, `Docker`, will run as a service, and we can control it through the CLI.


## Docker Desktop :
If you also need to manage your Docker through a graphical user interface (GUI), Docker Desktop helps you manage your Docker through the `Docker API`. It's simple and a useful tool.


# Installing Docker Engine and Desktop through `InstallDockerOnUbuntu.sh`
If you are using a Ubuntu Linux base, `InstallDockerOnUbuntu.sh` script helps you install `Docker Engine` and `Docker Desktop` easily. You can simply run the `./InstallDockerOnUbuntu.sh script`.

It will download and install all necessarily `.deb` package from `Docker` website.


> Note : Before using any bash script inside this `repo` please be carfull to run them in test environment and be sure don't use them in production environment.


## Installing All Necessary IMAGES to setup Development environment thorugh `DownloadAllNecessarilyDockerImages.sh`
These are list of Image that I perfer download and install before development process :`nginx`, `rabbitmq`, `mongo`, `apache/kafka`, `mysql`, `postgres`, `scylladb/scylla`, `redis`, `node`, `php`, `golang`, `python`, `rust`, `hello-world``DownloadAllNecessarilyDockerImages.sh` help to download them without any problem.

if you are guys like me want download all above images you just need to run `DownloadAllNecessarilyDockerImages.sh` script.

## Testing Dockers service through `UpAndRuning10SampleContinerOnDocker.sh`
if you install and download all necessarily docker packages and would you like to test your docker on your machine you can just running `UpAndRuning10SampleContinerOnDocker.sh` script. this script will pull down `hello-world` image from
`Docker Hub` then run 10 instance of it simultancly. when its job was done you can watch all docker `containers` that runned through `UpAndRuning10SampleContinerOnDocker.sh`

## Clean up All Test Containers that runned in the last step through `RemoveAllContainerFromDockerHistory.sh` 
After testing docker you should need to remove all test containers. `RemoveAllContainerFromDockerHistory.sh` script will remove all test containers quickly. you just need to run it.

## Kill and Stop All Docker Cointainers that runned before through `KillAndStopAllDockerContainer.sh`
If you are running a bunch of container in background for test and would you like to kill and stop all of them this `KillAndStopAllDockerContainer.sh` bash script will help you to stop all of them quickly.
