FROM debian:10
RUN apt-get update && apt-get install -y git
RUN apt-get install -y virtualenv python3-dev python3-pip libffi-dev build-essential libncurses-dev avrdude gcc-avr binutils-avr avr-libc stm32flash dfu-util libnewlib-arm-none-eabi gcc-arm-none-eabi binutils-arm-none-eabi libusb-1.0
RUN adduser klipper --gecos "" --disabled-password
RUN git clone https://github.com/Klipper3d/klipper.git
RUN python3 -m pip install -r klipper/scripts/klippy-requirements.txt
RUN python3 -m pip install OctoPrint
CMD python3 klipper/klippy/klippy.py /data/printer.cfg -l /tmp/log -a /tmp/klippy_uds
