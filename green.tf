resource "aws_elastic_beanstalk_environment" "my_green" {
  name                = "TealO-App-env1-MYGreen"
  application         = "${aws_elastic_beanstalk_application.myapp.name}"
  cname_prefix        = "agstechtutorialapp1green"

  solution_stack_name = "64bit Amazon Linux 2017.09 v2.7.0 running Tomcat 8 Java 8"

  # This is the VPC that the instances will use.
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "${aws_vpc.pipeline.id}"
  }


  # This is the subnets for the instances.
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "${aws_subnet.default.id}"
  }
}
