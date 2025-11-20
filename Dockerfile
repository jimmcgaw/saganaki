# Use the official lightweight OPA image
FROM openpolicyagent/opa:latest

# Create a directory for your policies
WORKDIR /app

# Copy your local policy files (e.g., valid.rego) into the container
# Assuming your rego files are in a local folder named 'policies'
COPY ./policies /app/policies

# Expose the default OPA port
EXPOSE 8181

# Start OPA in server mode
# --server: Runs as a server
# --addr=0.0.0.0:8181: Binds to all interfaces (CRITICAL for Docker networking)
# /app/policies: Tells OPA to load the files in this directory
CMD ["run", "--server", "--addr=0.0.0.0:8181", "/app/policies"]