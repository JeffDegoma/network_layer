provider "aws" {
    region = "us-east-1"
}


module "vpc_peer" {
  source = "./peering_network"
}

resource aws_vpc_peering_connection {
  //peer_owner_id
  //peer_vpc_id  secondary vpc
  //vpc_id       primary vpc
  //auto_accept
}
