
resource "aws_vpc" "dev" {
  cidr_block        =    "${var.vpc_cidr}"

  tags {
    "Environment"   =  "${var.environment}"
  }
}


resource "aws_internet_gateway" "igw" {
    vpc_id          =    "${aws_vpc.dev.id}"
}

 ################# Public Subnets #############
resource "aws_subnet" "public" {//3 PUBLIC subnets in DEV VPC across 3 availability zones
    count           =   "${length(var.subnet_cidr_public)}" //length of subnets defined
    vpc_id          =   "${aws_vpc.dev.id}"
    cidr_block      =   "${element(var.subnet_cidr_public,count.index)}"
    availability_zone   =  "${element(var.az, count.index)}"
    
}


 ################# Private Subnets #############
resource "aws_subnet" "private" {//3 PRIVATE subnets in DEV VPC across 3 availability zones
    count           =   "${length(var.subnet_cidr_private)}"
    vpc_id          =   "${aws_vpc.dev.id}"
    cidr_block      =   "${element(var.subnet_cidr_private,count.index)}"
    availability_zone   =  "${element(var.az, count.index)}"
    
}

############# Route Tables #############
resource "aws_route_table" "public_route" {
  vpc_id            =   "${aws_vpc.dev.id}"

  route {
      cidr_block    =   "0.0.0.0/0"
      gateway_id    =   "${aws_internet_gateway.igw.id}"
  }
  tags {
      Name          =   "public_route_table"
  }
}


resource "aws_route_table" "private_route" {
    vpc_id          =   "${aws_vpc.dev.id}"

    route {
        cidr_block  =   "0.0.0.0/0"
        gateway_id  =   "${aws_internet_gateway.igw.id}" //change to map to natgateway id
    }

    tags {
        Name        =    "private_route_table"
    }
}

############# Route Tables Association #############
resource "aws_route_table_association" "public_route" {
  count             =   "${length(var.subnet_cidr_public)}"
  subnet_id         =   "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id    =   "${aws_route_table.public_route.id}"
}


// private route table association
resource "aws_route_table_association" "private_route" {
  count             =   "${length(var.subnet_cidr_private)}"
  subnet_id         =   "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id    =   "${aws_route_table.private_route.id}"
}

