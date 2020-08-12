#### VCN  #######
resource "oci_core_virtual_network" "vcn_tf" {
  cidr_block     = var.vcn_tf_details.cidr_block
  compartment_id = var.tf_compartment.compartment_id
  display_name   = var.vcn_tf_details.display_name
  dns_label      = var.vcn_tf_details.dns_label

  provisioner "local-exec" {
    command = var.vcn_tf_details.provisioner_command
  }
}

#### Internet Gateway ###
resource "oci_core_internet_gateway" "igw_tf" {
  compartment_id = var.tf_compartment.compartment_id
  display_name   = var.igw_tf_details.display_name
  vcn_id         = oci_core_virtual_network.vcn_tf.id
}

#### Route Table #####
resource "oci_core_route_table" "rt1_tf" {
  compartment_id = var.tf_compartment.compartment_id
  vcn_id         = oci_core_virtual_network.vcn_tf.id
  display_name   = var.rt1_tf_details.display_name

  route_rules {
    destination       = var.rt1_tf_details.route_rules_destination
    network_entity_id = oci_core_internet_gateway.igw_tf.id
  }
}

##### Security Lists ######
resource "oci_core_security_list" "sl_w" {
  display_name   = "sl-loadbalancer"
  compartment_id = var.tf_compartment.compartment_id
  vcn_id         = oci_core_virtual_network.vcn_tf.id

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

resource "oci_core_subnet" "subnet1_tf" {
  availability_domain = lookup(data.oci_identity_availability_domains.targetRegion.availability_domains[0],"name")
  cidr_block          = var.subnet1_tf_details.cidr_block
  display_name        = var.subnet1_tf_details.display_name
  security_list_ids   = [oci_core_security_list.sl_w.id]
  compartment_id      = var.tf_compartment.compartment_id
  vcn_id              = oci_core_virtual_network.vcn_tf.id
  route_table_id      = oci_core_route_table.rt1_tf.id
  dhcp_options_id     = oci_core_virtual_network.vcn_tf.default_dhcp_options_id

  provisioner "local-exec" {
    command = var.subnet1_tf_details.provisioner_command
  }
}

resource "oci_core_subnet" "subnet2_tf" {
  availability_domain = lookup(length(data.oci_identity_availability_domains.targetRegion.availability_domains) > 1 ?
                               data.oci_identity_availability_domains.targetRegion.availability_domains[1] :
                               data.oci_identity_availability_domains.targetRegion.availability_domains[0],"name")
  cidr_block          = var.subnet2_tf_details.cidr_block
  display_name        = var.subnet2_tf_details.display_name
  security_list_ids   = [oci_core_security_list.sl_w.id]
  compartment_id      = var.tf_compartment.compartment_id
  vcn_id              = oci_core_virtual_network.vcn_tf.id
  route_table_id      = oci_core_route_table.rt1_tf.id
  dhcp_options_id     = oci_core_virtual_network.vcn_tf.default_dhcp_options_id

  provisioner "local-exec" {
    command = var.subnet2_tf_details.provisioner_command
  }
}