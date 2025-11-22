package auth

# Optional: explicit strict mode
import rego.v1

default allow := false

allow if {
	input.role == "admin"
}
