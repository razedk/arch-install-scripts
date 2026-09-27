#!/usr/bin/env bash

set -euo pipefail

# -----------------------------------------------------------------------------
# Check for root/sudo privileges
# -----------------------------------------------------------------------------
if [ "$EUID" -ne 0 ]; then
  echo "Error: This script must be run as root or with sudo." >&2
  exit 1
fi

# -----------------------------------------------------------------------------
# Configuration
# -----------------------------------------------------------------------------

# Correct, compliant data path for the system daemon
GRD_DIR="/var/lib/gnome-remote-desktop/.local/share/gnome-remote-desktop"
DAYS=720

mkdir -p "${GRD_DIR}"

CERT_FILE="${GRD_DIR}/tls.crt"
KEY_FILE="${GRD_DIR}/tls.key"

# -----------------------------------------------------------------------------
# Remove old certs
# -----------------------------------------------------------------------------

rm -f "${CERT_FILE}" "${KEY_FILE}"

# -----------------------------------------------------------------------------
# Generate private key
# -----------------------------------------------------------------------------

echo "Generating private key..."

openssl genrsa \
    -out "${KEY_FILE}" \
    4096

# -----------------------------------------------------------------------------
# Generate self-signed certificate
# -----------------------------------------------------------------------------

echo "Generating self-signed certificate..."

openssl req \
    -new \
    -x509 \
    -key "${KEY_FILE}" \
    -out "${CERT_FILE}" \
    -days "${DAYS}" \
    -subj "/CN=localhost"

# -----------------------------------------------------------------------------
# Permissions & Ownership
# -----------------------------------------------------------------------------

echo "Setting file permissions and ownership..."
chmod 600 "${KEY_FILE}"
chmod 644 "${CERT_FILE}"

# Secure ownership to the dedicated system user
if id "gnome-remote-desktop" &>/dev/null; then
    chown -R gnome-remote-desktop:gnome-remote-desktop "/var/lib/gnome-remote-desktop"
else
    chown -R gdm:gdm "/var/lib/gnome-remote-desktop" 2>/dev/null || true
fi

# -----------------------------------------------------------------------------
# Verify certificate
# -----------------------------------------------------------------------------

echo
echo "Verifying generated certificate..."
openssl x509 -in "${CERT_FILE}" -text -noout >/dev/null
echo "Certificate is valid."

# -----------------------------------------------------------------------------
# Configure GNOME Remote Desktop (System Level)
# -----------------------------------------------------------------------------

echo
echo "Configuring GNOME Remote Desktop (System Service)..."

# Clear existing configurations completely using literal paths
grdctl --system rdp set-tls-key ""
grdctl --system rdp set-tls-cert ""

# Force explicit absolute paths to bypass the parsing bug
grdctl --system rdp set-tls-key "/var/lib/gnome-remote-desktop/.local/share/gnome-remote-desktop/tls.key"
grdctl --system rdp set-tls-cert "/var/lib/gnome-remote-desktop/.local/share/gnome-remote-desktop/tls.crt"

# Enable the system RDP server
grdctl --system rdp enable

# -----------------------------------------------------------------------------
# Restart system-level service
# -----------------------------------------------------------------------------

echo
echo "Restarting system service..."
systemctl restart gnome-remote-desktop.service

# -----------------------------------------------------------------------------
# Show status
# -----------------------------------------------------------------------------

echo
grdctl --system status
