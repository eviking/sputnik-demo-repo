name "sputnik-base"
description "Sputnik laptop base role."
run_list(
  "recipe[apt::cacher-ng]",
  "recipe[lxc]",
  "recipe[lxc::containers]"
  )

override_attributes(
  "lxc" => {
    "addr" => '10.0.98.1',
    "network" => '10.0.98.0/24',
    "dhcp_range" => '10.0.98.2,10.0.98.254',
    "containers" => {
      "example" => {
        "template" => "ubuntu"
      }
    }
  }
  )
