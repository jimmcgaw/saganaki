package api_check

import rego.v1

# Default deny
default allow := false

allow if {
    # 1. Call the external API
    response := http.send({
        "method": "GET",
        "url": "https://api.internal/user/status"
    })
    
    # 2. Check if the status is 200 and body status is "Active"
    response.status_code == 200
    response.body.status == "Active"
}