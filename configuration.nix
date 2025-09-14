## file: ./configuration.nix
{ pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.firewall.allowedTCPPorts = [ 22 80 ];

  users.users.root = {
    initialPassword = "nixos";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDPhYNCzPRJw9Zg3ikF1DQGizschh50SA/R1u3SBJtC3lLw85MhS7vnZXDB1hDYmD6Na2T4MKMjORFFzF+zGxD1k17s0ctdCXeNB6b3CTrb3ekW5+hrEjz11rQMEVuxlzP8D0YyS72ETebtNKlpxN74u/JpHiSy8Z9Vzl2tSfgrPsaJ6KWOiPqlvpNf7d1ttWUyavg+G75vna1vVQtVjoBj8eErZJzF17x9p03A9XfbE2CuVFt4XrmGtWTM4nOPI0c9+CWUVs7p3rDInJY5WEvbbObeKGTb/tjg6xxLMITuc/W7jdbI1QhtwjYKJpgx38PbeUAFsjwnfbaNZ1/IR+/JnnYHPWzLFGXFy10/JUA1r0YqTi1XqDVdvPFAV1khr/3/3Vkf970wAjWU/e9djxqdYRAivbqe+hUwaRBvm5L97bPKs2ihfBVJIoQU3A4b1qf0zT9UFCMAIY+flfAz4SP67ckTakJZns2Kexy0ChIr/f6AJPi93uni3cNPxWmBs6M= eddy@ULU"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDFeC4sVyzBgYdzfHylsqBc7d16iiNDOaIpb6m6mMP4DyOZNHDqsF+BdpK8AM7jWGpajRvy78vVhU1Ln2v2gVe8/9BwsNJhBP7m7/HxFf+fglMqBgJbZy/x6iUdwcZWwP+rzByalJA2FzXt+0JENuiZ6f/YYdnW9v2JzYn5Fmv3+KQ+BXJnsUXRf9t7qFT2EDsJ3WtGlOm3RPvDBlcZeQ+Fp6EEEPaw7DaRkuLXj6EhiGcBPaEXOfD6sNUBonoy+sqA5ZLzUzpf3iDf6aqo4gRH4XfANJNt2JrribVDiVvpkZldFjbePgDbLtqZP5jZbHaHWijEykyVBnWPH1lQv4bcCpp3VwRVhFiMK0QOI3Yf2zTXGgBfrml9bjJjFQgVDdeU4wrVPowUlNbtC4zHO5t9uorc+x9r+5DQ9LVhNVqvQT8PTRiJgneFJRqsZnRH0muFwRlu9niPg8S1LdLQTCp6uvB90Ao25n+uHMERYyuDu4WOwtiqY8CaXzSrHUO1Wcfr5UixuwYLxU3QzTb7fFph/V+AZ8AgjSBnG0FuOosdpgrC7LpBcu/AQwG2OGqJfUnI/7QPiq+UgMAcPlBdFv33YGavpNc6BQNxx9Ui9dfH8cnodW+yeOWW+HkJ7re/xfYtc7SOmIcs7/YfdlUeBowA19YYiWoPKY75+IV/j97dlQ== eddy.deboer@ulu.io"
    ];
  };

  services.openssh.enable = true;

  services.nginx = {
    enable = true;
    virtualHosts."localhost" = {
      default = true;
      locations."/" = {
        return = "200 'Hello World!'";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    vim
  ];

  system.stateVersion = "24.05";
}
