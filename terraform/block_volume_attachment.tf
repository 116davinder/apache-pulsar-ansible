
resource "oci_core_volume_attachment" "pulsar_broker_volume_attachment" {
    count = "${var.pulsar_broker_instance_count}"
    attachment_type = "iscsi"
    instance_id = "${element(oci_core_instance.pulsar-broker.*.id, count.index)}"
    volume_id = "${element(oci_core_volume.pulsar-broker-volume.*.id, count.index)}"

    display_name = "pulsar-broker-volume-attachment-${count.index + 1}"
    is_pv_encryption_in_transit_enabled = false
    is_read_only = false
    use_chap = false
}

resource "oci_core_volume_attachment" "pulsar_bookeeper_volume_attachment" {
    count = "${var.pulsar_bookeeper_instance_count}"
    attachment_type = "iscsi"
    instance_id = "${element(oci_core_instance.pulsar-bookeeper.*.id, count.index)}"
    volume_id = "${element(oci_core_volume.pulsar-bookeeper-volume.*.id, count.index)}"

    display_name = "pulsar-bookeeper-volume-attachment-${count.index + 1}"
    is_pv_encryption_in_transit_enabled = false
    is_read_only = false
    use_chap = false
}

output "pulsar-broker-volume-attachment-details" {
  value = "${oci_core_volume_attachment.pulsar_broker_volume_attachment[*].id}"
}

output "pulsar-bookeeper-volume-attachment-details" {
  value = "${oci_core_volume_attachment.pulsar_bookeeper_volume_attachment[*].id}"
}