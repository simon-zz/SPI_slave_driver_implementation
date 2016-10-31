ARCH := arm
COMPILER := arm-linux-gnueabihf-
COMPILER_V := gcc
PWD := $(shell pwd)
KERN_V=4.4.9
BUILD_V=-ti-r25
SOURCE=linux-stable-rcn-ee
SUBDIRS=firmware/

KDIR := $(PWD)/$(SOURCE)-$(KERN_V)$(BUILD_V)

obj-m+= driver/spi-slave-core.o driver/spi-pru-slave.o driver/spi-slave-dev.o

default:
	$(MAKE) -C $(KDIR) M=$(PWD) ARCH=$(ARCH) CROSS_COMPILE=$(COMPILER) modules
	$(COMPILER)$(COMPILER_V) -o slave_app/slave_app slave_app/slave_app.c
clean:
	$(MAKE) -C $(KDIR) M=$(PWD) ARCH=$(ARCH) clean

