resource "oci_core_volume" "pulsar-broker-volume" {
    count = "${var.pulsar_broker_instance_count}"
    availability_domain = "${var.instance_availability_domain}"
    compartment_id = "${var.compartment_ocid}"
    display_name = "pulsar-broker-volume-${count.index + 1}"
    size_in_gbs = "${var.pulsar_broker_block_volume_size_gb}"
}

resource "oci_core_volume" "pulsar-bookeeper-volume" {
    count = "${var.pulsar_bookeeper_instance_count}"
    availability_domain = "${var.instance_availability_domain}"
    compartment_id = "${var.compartment_ocid}"
    display_name = "pulsar-bookeeper-volume-${count.index + 1}"
    size_in_gbs = "${var.pulsar_bookeeper_block_volume_size_gb}"
}