#!/bin/sh

function now () {
	date "+%Y-%m-%d %H:%M:%S"
}

function rehash () {
	type -P plenv >/dev/null && plenv rehash
	type -P pyenv >/dev/null && pyenv rehash
	type -P rbenv >/dev/null && rbenv rehash
}
