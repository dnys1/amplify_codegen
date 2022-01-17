.PHONY: protos
protos:
	@dart pub global activate protoc_plugin
	@export PATH="${PATH}:${HOME}/.pub-cache/bin"
	protoc --dart_out=../lib/src/model -I. model.proto