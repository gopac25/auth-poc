resource "aws_launch_configuration" "auth-poc-launchconfig-web" {
  name_prefix          = "auth-poc-launchconfig-web"
  image_id             = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type        = "t2.micro"
  count                = "${var.count}"
  key_name             = "${aws_key_pair.mykey.key_name}"
  security_groups      = ["${aws_security_group.allow-ssh.id}"]
}

resource "aws_autoscaling_group" "auth-poc-autoscaling-web" {
  name                 = "auth-poc-autoscaling-web"
  vpc_zone_identifier  = ["${aws_subnet.auth-poc-private.id}"]
  launch_configuration = "${aws_launch_configuration.auth-poc-launchconfig-web.name}"
  min_size             = 2
  max_size             = 4
  health_check_grace_period = 300
  health_check_type = "EC2"
  force_delete = true

  tag {
      key = "Name"
      value = "${format("web-%03d", count.index + 1)}"
      propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_bar_web" {
  autoscaling_group_name = "${aws_autoscaling_group.auth-poc-autoscaling-web.id}"
  elb                    = "${aws_elb.my-elb-web.id}"
}
