###########
# NETWORK #
###########

resource "aws_vpc" "pipeline" {
  cidr_block      =   "${var.vpc_cidr}"
  tags {
          Name    =   "${var.app_name}-${var.environ}"
          owner   =   "${var.owner}"
          environ =   "${var.environ}"
  }
}

resource "aws_subnet" "default" {
  vpc_id                  = "${aws_vpc.pipeline.id}"
  availability_zone       = "eu-west-1a"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags {
        Name = "Subnet A"
  }
}


resource "aws_internet_gateway" "default" {
    vpc_id    =   "${aws_vpc.pipeline.id}"
    tags {
      Name    =   "${var.app_name}-${var.environ}_Terraform_IGW"
      owner   =   "${var.owner}"
    }
}

resource  "aws_route_table" "main_table" {
  vpc_id    =   "${aws_vpc.pipeline.id}"
  route {
    cidr_block    =   "0.0.0.0/0"
    gateway_id    =   "${aws_internet_gateway.default.id}"
  }
}


resource "aws_route_table_association" "terraform_public" {
  subnet_id             =       "${element ( aws_subnet.default.*.id, count.index)}"
  route_table_id        =       "${aws_route_table.main_table.id}"
  count                 =       "${length( split ( ",", lookup (var.azs, var.region ) ) ) }"
}


