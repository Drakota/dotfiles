{ pkgs, ... }:

{
  # Enable the virtualization daemon
  virtualisation.libvirtd.enable = true;
  users.users.drakota.extraGroups = [
    "libvirtd"
    "kvm"
  ];

  # Install virtualization management tools
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
  ];

  systemd.services.kali-vm-setup = {
    description = "Setup Kali VM";
    after = [
      "libvirtd.service"
      "libvirtd-network-bridge.service"
    ];
    requires = [ "libvirtd.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      set -e

      # Create VM if it does not exist
      if ! ${pkgs.libvirt}/bin/virsh list --all | grep -q "kali-vm"; then
        # Ensure the default network is active
        if ! ${pkgs.libvirt}/bin/virsh net-list --all | grep -q "default.*active"; then
          echo "Starting default network..."
          ${pkgs.libvirt}/bin/virsh net-start default
        fi

        # Ensure images directory exists
        mkdir -p /var/lib/libvirt/images
        # Download and extract Kali Linux image if not already present
        KALI_7Z="/var/lib/libvirt/images/kali-vm.7z"
        KALI_IMG="/var/lib/libvirt/images/kali-vm.qcow2"
        if [ ! -f "$KALI_IMG" ]; then
          echo "Downloading Kali Linux image..."
          ${pkgs.curl}/bin/curl -L -o "$KALI_7Z" "https://mirror.xenyth.net/kali-images/kali-2025.2/kali-linux-2025.2-qemu-amd64.7z"
          echo "Extracting Kali Linux image..."
          ${pkgs.p7zip}/bin/7z e "$KALI_7Z" -o/var/lib/libvirt/images
          # Rename extracted file if needed
          if [ -f "/var/lib/libvirt/images/kali-linux-2025.2-qemu-amd64.qcow2" ] && [ "/var/lib/libvirt/images/kali-linux-2025.2-qemu-amd64.qcow2" != "$KALI_IMG" ]; then
            mv "/var/lib/libvirt/images/kali-linux-2025.2-qemu-amd64.qcow2" "$KALI_IMG"
          fi
        fi

        echo "Creating Kali VM..."
        ${pkgs.virt-manager}/bin/virt-install \
          --name kali-vm \
          --ram 8192 \
          --vcpus 8 \
          --disk path=$KALI_IMG,format=qcow2 \
          --import \
          --os-variant debian10 \
          --graphics spice \
          --video virtio \
          --channel spicevmc \
          --noautoconsole
      fi
    '';
  };
}
