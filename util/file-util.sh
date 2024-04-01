#!/bin/bash

file_util_create_dir() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
    fi
}

file_util_delete_create_dir() {
    if [ -d "$1" ]; then
        rm -rf "$1"
    fi
	mkdir -p "$1"
}

file_util_get_file_name() {
    echo "${1##*/}"
}

file_util_get_file_name_no_ext() {
    basename="${1##*/}"
	echo "${basename%%.*}"
}

file_util_create_sym_link() {
    local source=$1
    local destination=$2

    # Check if the destination exists and remove it if it does
    if [ -e "$destination" ]; then
        rm -rf "$destination"
    fi

    # Check if the destination exists as a sym link
    if [ -L "$destination" ]; then
        rm "$destination"
    fi

   # Create symbolic link
    ln -s "$source" "$destination"
}

