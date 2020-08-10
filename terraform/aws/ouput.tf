output pulsar_broker_public_ip {
  value                   = aws_instance.pulsar_broker[*].public_ip
  sensitive               = false
}

output pulsar_bookkeeper_public_ip {
  value                   = aws_instance.pulsar_bookkeeper[*].public_ip
  sensitive               = false
}
