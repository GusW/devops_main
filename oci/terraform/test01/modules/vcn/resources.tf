
#### VCN  #######
resource "oci_core_virtual_network" "vcn_tf" {
  cidr_block     = var.oci_vcn.cidr_block
  compartment_id = var.oci_compartment.compartment_id
  display_name   = var.oci_vcn.display_name
  dns_label      = var.oci_vcn.dns_label

  provisioner "local-exec" {
    command = var.oci_vcn.provisioner_command
  }
}

#### Internet Gateway ###
resource "oci_core_internet_gateway" "igw_tf" {
  compartment_id = oci_core_virtual_network.vcn_tf.compartment_id
  display_name   = var.oci_internet_gateway.display_name
  vcn_id         = oci_core_virtual_network.vcn_tf.id
}

#### Route Table #####
resource "oci_core_route_table" "rt1_tf" {
  compartment_id = oci_core_virtual_network.vcn_tf.compartment_id
  vcn_id         = oci_core_virtual_network.vcn_tf.id
  display_name   = var.oci_route_table.display_name

  route_rules {
    destination       = var.oci_route_table.route_rules_destination
    network_entity_id = oci_core_internet_gateway.igw_tf.id
  }
}

##### Security Lists ######
resource "oci_core_security_list" "sl_w" {
  display_name   = var.oci_security_list.display_name
  compartment_id = oci_core_virtual_network.vcn_tf.compartment_id
  vcn_id         = oci_core_virtual_network.vcn_tf.id

  # TODO is there a better way to handle the creation of all these security rules?
  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    tcp_options {
      max = 22
      min = 22
    }

    protocol = "6"
    source   = "0.0.0.0/0"
  }

  ingress_security_rules {
    tcp_options {
      max = 80
      min = 80
    }

    protocol = "6"
    source   = "0.0.0.0/0"
  }

  ingress_security_rules {
    tcp_options {
      max = 443
      min = 443
    }

    protocol = "6"
    source   = "0.0.0.0/0"
  }

  ingress_security_rules {
    icmp_options {
      type = 0
    }

    protocol = 1
    source   = "0.0.0.0/0"
  }

  ingress_security_rules {
    icmp_options {
      type = 3
      code = 4
    }

    protocol = 1
    source   = "0.0.0.0/0"
  }

  ingress_security_rules {
    icmp_options {
      type = 8
    }

    protocol = 1
    source   = "0.0.0.0/0"
  }
}


#### Subnet  #######
resource "oci_core_subnet" "subnet_tf" {
  count               = var.subnet_count
  availability_domain = lookup(data.oci_identity_availability_domains.targetRegion.availability_domains[0], "name")
  cidr_block          = cidrsubnet(oci_core_virtual_network.vcn_tf.cidr_block, var.oci_vcn_subnet.subnet_newbits, count.index)
  display_name        = "${var.oci_vcn_subnet.display_name}${count.index + 1}"
  security_list_ids   = [oci_core_security_list.sl_w.id]
  compartment_id      = oci_core_virtual_network.vcn_tf.compartment_id
  vcn_id              = oci_core_virtual_network.vcn_tf.id
  route_table_id      = oci_core_route_table.rt1_tf.id
  dhcp_options_id     = oci_core_virtual_network.vcn_tf.default_dhcp_options_id

  provisioner "local-exec" {
    command = var.oci_vcn_subnet.provisioner_command
  }
}