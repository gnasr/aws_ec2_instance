resource "aws_instance" "ec2_instance" {
  ami             = "${var.ami}"
  instance_type   = "${var.instance_type}"
  key_name        = "${var.key_name}"
  monitoring      = "${var.monitoring}"
  security_groups = ["${var.security_groups}"]
  subnet_id       = "${element(flatten(var.subnet_id), count.index)}"
  user_data       = "${var.user_data}"

  root_block_device {
    volume_type           = "${var.root_block_device_type}"
    volume_size           = "${var.root_block_device_volume_size}"
    delete_on_termination = "${var.root_block_device_delete_on_termination}"
  }

  count = "${var.count}"

  tags {
    Name        = "${var.count == 1 ? var.name : format("${var.name}-%03d", count.index + 1) }"
    Environment = "${var.environment}"
    Terraform   = "true"
  }
}
