output "vpc" {
    value = "${aws_vpc.pipeline.id}"
}

output "cname-blue" {
  value = "${aws_elastic_beanstalk_environment.my_blue.cname}"
}

output "cname-green" {
  value = "${aws_elastic_beanstalk_environment.my_green.cname}"
}
