FROM	debian:latest

RUN		apt-get update -y \
		&& apt-get upgrade -y \
		&& apt-get install -y git \
				sudo \
				make \
				cmake \
				valgrind

# MLX Configuration + dependencies required for MLX to work on Linux
RUN		apt-get install -y xorg \
				libxext-dev \
				zlib1g-dev \
				libbsd-dev \
		&& git clone https://github.com/42Paris/minilibx-linux.git mlx \
		&& cd mlx \
		&& ./configure \
		&& cp libmlx.a /usr/local/lib/ \
		&& cp mlx.h /usr/local/include/mlx.h