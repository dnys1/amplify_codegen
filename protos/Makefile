.PHONY: protos
protos:
	@dart pub global activate protoc_plugin
	@export PATH="${PATH}:${HOME}/.pub-cache/bin"
	protoc --dart_out=../lib/src/model --experimental_allow_proto3_optional -I. model.proto