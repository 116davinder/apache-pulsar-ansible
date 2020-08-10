variable region {
  type                    = string
  default                 = "eu-central-1"
  description             = "AWS Region"
}

variable env {
  type                    = string
  default                 = "development"
  description             = "environment name"
}

variable vpc_id {
  type                    = string
  default                 = "vpc-0935362fca368f01f"
}

variable subnet_id {
  type                    = string
  default                 = "subnet-00f117908461e14c4"
}

variable instance_type {
  type                    = string
  default                 = "t2.micro"
  description             = "Instance Type"
}

variable key_name {
  type                    = string
  default                 = "davinder-test-terraform"
  description             = "aws ec2 ssh key pair name"
}

variable pulsar_bookkeeper_nodes {
  type                    = number
  default                 = 1
  description             = "how many nodes of pulsar bookkeeper cluster is required?"
}

variable pulsar_bookkeeper_volume_size {
  type                    = number
  default                 = 30
  description             = "how much size of pulsar bookkeeper data volume is required?"
}

variable pulsar_bookkeeper_root_volume_size {
  type                    = number
  default                 = 10
  description             = "how much size of pulsar_bookkeeper root volume is required?"
}

variable pulsar_bookkeeper_ebs_attach_location {
  type                    = string
  default                 = "/dev/sdc"
  description             = "disk location in linux machine"
}

variable pulsar_broker_nodes {
  type                    = number
  default                 = 1
  description             = "how many nodes of pulsar broker cluster is required?"
}

variable pulsar_broker_volume_size {
  type                    = number
  default                 = 30
  description             = "how much size of pulsar broker data volume is required?"
}

variable pulsar_broker_root_volume_size {
  type                    = number
  default                 = 10
  description             = "how much size of pulsar broker root volume is required?"
}

variable pulsar_broker_ebs_attach_location {
  type                    = string
  default                 = "/dev/sdc"
  description             = "disk location in linux machine"
}

variable ec2_cloudwatch_role {
  type                    = string
  default                 = "Pulsar-CloudWatchAgentServerRole"
  description             = "aws ec2 cloudwatch role"
}