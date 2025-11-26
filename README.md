# rhel-nmap

A containerized nmap security scanning tool built on Red Hat UBI 8, configured with elevated network capabilities for authorized network testing and penetration testing.

## Prerequisites

- Docker or Podman installed
- Root or sudo access (required for network scanning)
- Proper authorization to scan target systems

## Quick Start

### Pull and Run

```bash
podman pull quay.io/denis_pttrsn/rhel-nmap:latest
podman run --privileged -it quay.io/denis_pttrsn/rhel-nmap:latest nmap -sS <hostname>
```

Or with Docker:

```bash
docker run --privileged -it quay.io/denis_pttrsn/rhel-nmap:latest nmap -sS <hostname>
```

## Usage Examples

### Basic SYN Scan
```bash
podman run --privileged -it quay.io/denis_pttrsn/rhel-nmap:latest nmap -sS <hostname>
```

### Full Port Scan
```bash
podman run --privileged -it quay.io/denis_pttrsn/rhel-nmap:latest nmap -p- <hostname>
```

### Service Detection
```bash
podman run --privileged -it quay.io/denis_pttrsn/rhel-nmap:latest nmap -sV <hostname>
```

### Scan Multiple Hosts
```bash
podman run --privileged -it quay.io/denis_pttrsn/rhel-nmap:latest nmap -sS <hostname1> <hostname2>
```

## Building Locally

```bash
docker build -t rhel-nmap:latest .
docker run --privileged -it rhel-nmap:latest nmap -sS <hostname>
```

## Image Details

- **Base Image**: Red Hat UBI 8 (ubi8/ubi)
- **Tools Included**: nmap, curl, which
- **Capabilities**: CAP_NET_RAW, CAP_NET_ADMIN, CAP_NET_BIND_SERVICE
- **User**: root

## Important Notes

- The `--privileged` flag is required because nmap uses raw sockets for network scanning, which requires elevated Linux capabilities
- This container should only be used for authorized security testing and penetration testing
- Ensure you have written permission to scan target systems before running scans

