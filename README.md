# trace-server

## Data

Put your trace data in `./trace/` folder.

## Build

`docker build -t trace-server:v1 .`

## Run

Firstly, execute on the host `docker run -it --cap-add=NET_ADMIN trace-server:v1` to enter the container

Then execute `bash bandwidth.sh [name-of-trace].log` in the container and wait until it ends.

The log can be found in `./log/bw_log_[name-of-trace].log` file.
