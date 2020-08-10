resource "aws_ebs_volume" "pulsar_bookkeeper" {
  count                   = var.pulsar_bookkeeper_nodes
  availability_zone       = data.aws_availability_zones.available.names[ count.index % length(data.aws_availability_zones.available.names) ]
  size                    = var.pulsar_bookkeeper_volume_size

  tags = {
    Name                  = "pulsar_bookkeeper-data-vol-${var.env}-${count.index}"
    Env                   = var.env
    Owner                 = "Terraform"
  }

}

resource "aws_ebs_volume" "pulsar_broker" {
  count                   = var.pulsar_broker_nodes
  availability_zone       = data.aws_availability_zones.available.names[ count.index % length(data.aws_availability_zones.available.names) ]
  size                    = var.pulsar_broker_volume_size

  tags = {
    Name                  = "pulsar_broker-data-vol-${var.env}-${count.index}"
    Env                   = var.env
    Owner                 = "Terraform"
  }

}