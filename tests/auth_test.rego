package auth_test

import rego.v1

import data.auth
import data.mocks.auth_test_cases


test_allow_if_admin if {
    print("ADMIN REQUEST TEST DATA:", auth_test_cases.admin_request)
	auth.allow with input as auth_test_cases.admin_request
}

test_deny_if_guest if {
    print("GUEST REQUEST TEST DATA:", auth_test_cases.admin_request)
	not auth.allow with input as auth_test_cases.guest_request
}
