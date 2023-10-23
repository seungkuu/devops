resource "aws_internet_gateway" "skk-internet-gateway" {

  // 인터넷 게이트웨이 설정 - 이름 태그
  tags = {
    Name = "skk-internet-gateway"
  }

  // 프로비저닝 전 VPC 생성 필요
  depends_on = [
    aws_vpc.skk-vpc
  ]

  // VPC Attach
  vpc_id = aws_vpc.skk-vpc.id


}
