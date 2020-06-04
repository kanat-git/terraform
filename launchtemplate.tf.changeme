provider "aws" {
  region = "us-east-1"
}

resource "aws_launch_template" "foobar" {
  name                   = "test launch template"
  image_id               = "${var.ami_id}"
  instance_type          = "${var.app_instance_type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var. _sg_1_id}", "${var. _sg_2_id}"]
  user_data              = "${base64encode("${file("userdata.sh")}")}"

  block_device_mappings {
    device_name = "/dev/sdb"

    ebs {
      volume_size = 100
    }
  }

  iam_instance_profile {
    name = "${var.iam_instance_profile}"
  }

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "sg-${var.environ}-sync${var.application}"

      tags = "${merge(map("Name", format("%s-%s-lc-ec2", var.orgname, var.environ)), var.tags)}"
    }
  }

  resource "aws_autoscaling_group" "asg_ec2" {
    name                      = "${var.orgname}-${var.environ}"
    vpc_zone_identifier       = ["subnet-0", "subnet-05", "subnet-06", "subnet-0d"]
    min_size                  = 1
    desired_capacity          = 1
    max_size                  = 1
    target_group_arns         = ["${var.alb_target}"]
    default_cooldown          = 100
    health_check_grace_period = 100
    termination_policies      = ["OldestLaunchConfiguration", "ClosestToNextInstanceHour", "OldestInstance"]
    health_check_type         = "ELB"

    launch_template = {
      id      = "${aws_launch_template.foobar.id}"
      version = "$$Latest"
    }

    lifecycle {
      create_before_destroy = true
    }

    tags = [
      {
        key                 = "Name"
        value               = "${var.orgname}"
        propagate_at_launch = true
      },
      {
        key                 = "Environ"
        value               = "${var.environ}"
        propagate_at_launch = true
      },
    ]
  }
}
