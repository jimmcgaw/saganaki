package authz

default is_admin := false

# is_admin = True if role is "admin" AND internal = True
is_admin if {
    input.user.role == "admin"
    input.user.internal
}

# is_internal = True if role is "admin" OR internal = True

# OR via multiple rules
default is_internal := false
is_internal if {
    input.user.role == "admin"
}

is_internal if {
    input.user.internal
}