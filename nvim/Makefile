# Usage:
# make        # Install package manager and aniseed to run fenel code
# make update # Run package manager update
# make clean  # remove ALL dependencies

.PHONY: all download_package_manager download_aniseed add_packages update clean

NVIM_DATA_PATH := $(shell nvim --headless --noplugin -c ':echo stdpath("data")' +"quitall" 2>&1)
NVIM_PACKAGE_PATH := "${NVIM_DATA_PATH}/site/pack"
PACKER_AUTOLOAD_DIR := "${NVIM_PACKAGE_PATH}/packer/start/"

all: download_package_manager download_aniseed update

download_package_manager:
ifneq (,$(wildcard ./${NVIM_PACKAGE_PATH}/packer/start/packer.nvim/))
	@echo "Cloning the package manager: Packer"
	git clone https://github.com/wbthomason/packer.nvim ${PACKER_AUTOLOAD_DIR}/packer.nvim
endif

download_aniseed:
ifneq (,$(wildcard ./${NVIM_PACKAGE_PATH}/packer/start/aniseed/))
	@echo "Cloning the package manager: Packer"
	git clone https://github.com/Olical/aniseed ${PACKER_AUTOLOAD_DIR}/aniseed
endif

update:
	@echo "Updating Pack dependencies" 
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

clean:
	rm -rf ${PACKER_AUTOLOAD_DIR}/*
	rm -rf lua/*.lua
