# Valgrind_1337

How to run Valgrind on your 1337 session using Docker.

## First of all, what is Valgrind?

Valgrind is an open source tool used for memory debugging, memory leak detection and profiling. It's also used for building dynamic analysis tools such as checkers and profilers.
[Official site](https://valgrind.org/).
[Read more](https://en.wikipedia.org/wiki/Valgrind)

An example of Valgrind output:

```==8== HEAP SUMMARY:
==8==     in use at exit: 1,322 bytes in 12 blocks
==8==   total heap usage: 53 allocs, 41 frees, 3,238 bytes allocated
==8==
==8== LEAK SUMMARY:
==8==    definitely lost: 1,055 bytes in 5 blocks
==8==    indirectly lost: 0 bytes in 0 blocks
==8==      possibly lost: 0 bytes in 0 blocks
==8==    still reachable: 267 bytes in 7 blocks
==8==         suppressed: 0 bytes in 0 blocks
==8== Rerun with --leak-check=full to see details of leaked memory
```

## What is Docker?

> Docker is a set of platform as a service (PaaS) products that use OS-level virtualization to deliver software in packages called containers. The service has both free and premium tiers. The software that hosts the containers is called Docker Engine. It was first started in 2013 and is developed by Docker, Inc. [Read more](<https://en.wikipedia.org/wiki/Docker_(software)>). [Official Website](https://www.docker.com/).

## How to install Docker on your Machine

Go to the Managed Softwar Center and download Docker from there.
![MSC](https://i.imgur.com/TjmwlqF.png)
Before launching Docker, we need to make sure it's Caches folder stored in `goinfre` folder. To do that:

```cd goinfre
mkdir docker
rm -rf ~/Library/Containers/com.docker.docker
ln -s ~/goinfre/docker ~/Library/Containers/com.docker.docker
```

Now you can launch Docker. Wait until the program says that it's running
![runningdocker](https://i.imgur.com/vppdEwm.png)

## How to Mount your project to the Docker container

Clone the Dockerfile that I made to build the docker image with the latest debian. The file also includes Valgrind and the dependencies needed for MLX Linux (You'll only have to run this command once):

``` 
docker build -t valgrind/1337 .
```

You'll need some time until Docker download debian and the other dependencies.
Then run this command which I'll break down to you:

``` 
docker run -it --rm -v ~/ThePathToYourFolder:/valgrind valgrind/1337
```

- run: to run the container with the tag valgrind/1337.

- -it: to run the container in an interactive mode. This means you can execute commands inside the container while it is still running and to have a bash shell prompt.

- --rm: to delete the container once we use the command `exit`.

- -v: to mount the folder where our program exist from the host to the container. it means that any change made inside the container will be visible outside of. And vice versa.

You can add this function to your ~/.zshrc so you can just run `doc <your_directory>` instead.

``` 
doc () {
	if [ -z "$1" ]; then
		echo "Usage: doc <your_directory>"
		return 1;
	fi

	local my_variable="$1"
	docker run -it --rm -v ~/Desktop/${my_variable}:/valgrind valgrind/1337
}
```

after doing so, reload your .zshrc configuration file by using ``` source ~/.zshrc ```

Simple example of the output:
<img width="1032" alt="image" src="https://github.com/Suigetsu/Valgrind_1337/assets/57911923/fa0c60bf-7fc3-4edb-8417-6943926c9c15">

## How to use Valgrind

Now all you have to is to compile your project, and run the command `valgrind ./the_executable_file`

## How to use GDB

Run docker with the flags: `--cap-add=SYS_PTRACE --security-opt seccomp=unconfined` before the `-it --rm` flags.
