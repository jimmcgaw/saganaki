package api_check_test

import rego.v1
import data.api_check

test_allow_if_active if {
    # Define the mock response object
    mock_response := {
        "status_code": 200,
        "body": {"status": "Active"}
    }

    # Run the rule, replacing http.send with our mock data
    api_check.allow with http.send as mock_response
}

test_deny_if_inactive if {
    mock_response := {
        "status_code": 200,
        "body": {"status": "Inactive"}
    }

    not api_check.allow with http.send as mock_response
}