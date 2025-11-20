package hello

default message := "Hello, World!"

message := "Hello, OPA!" if input.name == "OPA"