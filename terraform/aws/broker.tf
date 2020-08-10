resource "aws_instance" "pulsar_broker" {
  count                   = var.pulsar_broker_nodes

  ami                     = data.aws_ami.amazon_ami.id
  instance_type           = var.instance_type
  key_name                = var.key_name
  subnet_id               = element(data.aws_subnet.pulsar_broker_public_subnet.*.id, count.index)
  vpc_security_group_ids  = ["${aws_security_group.pulsar_sg.id}"]
  
  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.pulsar_broker_root_volume_size
  }

  tags = {
    Name                  = "pulsar-broker-${var.env}-${count.index}"
    Env                   = var.env
    Owner                 = "Terraform"
    Software              = "Apache Pulsar Broker"
  }

  volume_tags = {
    Owner                 = "Terraform"
  }

  monitoring              = false

  availability_zone       = data.aws_availability_zones.available.names[ count.index % length(data.aws_availability_zones.available.names) ]
  iam_instance_profile    = var.ec2_cloudwatch_role
  depends_on              = [aws_security_group.pulsar_sg,aws_iam_instance_profile.Pulsar-CloudWatchAgentServerRole-Profile]

}

resource "aws_volume_attachment" "pulsar_broker_ebs_attach" {
  count                   = var.pulsar_broker_nodes
  device_name             = var.pulsar_broker_ebs_attach_location
  volume_id               = element(aws_ebs_volume.pulsar_broker.*.id, count.index)
  instance_id             = element(aws_instance.pulsar_broker.*.id, count.index)
  force_detach            = true
}