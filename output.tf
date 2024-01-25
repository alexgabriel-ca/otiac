output "ec2_global_ips" {
  value = ["${aws_instance.central_web_instance.*.public_ip}", "${aws_instance.central_web_instance.*.private_ip}", "${aws_instance.west_web_instance.*.public_ip}", "${aws_instance.west_web_instance.*.private_ip}"]
}
