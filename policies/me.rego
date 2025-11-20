package satisfaction

default is_me := false

is_me if {
    input.user.first_name == "Jim"
    input.user.last_name == "McGaw"
}