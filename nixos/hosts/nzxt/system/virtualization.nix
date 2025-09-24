{ pkgs, ... }:

let
  kaliImage = pkgs.stdenv.mkDerivation {
    name = "kali-vm-image";
    src = pkgs.fetchurl {
      url = "https://mirror.xenyth.net/kali-images/kali-2025.2/kali-linux-2025.2-qemu-amd64.7z";
      sha256 = "1lyn8xx65i1vcjf5rmwwrq8pdvmhxpm5yynr6ikiq58xq4mv902j";
    };
    nativeBuildInputs = [ pkgs.p7zip ];
    unpackPhase = "true";
    installPhase = ''
      mkdir -p $out
      7z e $src -o$out
      mv $out/kali-linux-2025.2-qemu-amd64.qcow2 $out/kali-vm.qcow2
    '';
  };
in
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
        if ! ${pkgs.libvirt}/bin/virsh net-info default | grep -q "Active:[[:space:]]*yes"; then
          echo "Starting default network..."
          ${pkgs.libvirt}/bin/virsh net-start default
        fi

        # Ensure images directory exists
        mkdir -p /var/lib/libvirt/images

        # Copy image if not already present
        cp -n ${kaliImage}/kali-vm.qcow2 /var/lib/libvirt/images/kali-vm.qcow2

        echo "Creating Kali VM..."
        ${pkgs.virt-manager}/bin/virt-install \
          --name kali-vm \
          --ram 8192 \
          --vcpus 8 \
          --disk path=/var/lib/libvirt/images/kali-vm.qcow2,format=qcow2 \
          --import \
          --os-variant debian10 \
          --graphics spice \
          --video virtio \
          --channel spicevmc \
          --noautoconsole
      else
        echo "Kali VM already exists. Skipping creation."
      fi
    '';
  };
}
