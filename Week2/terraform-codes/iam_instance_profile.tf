// IAM 인스턴스 프로파일 지정
resource "aws_iam_instance_profile" "skk-ec2-instance-profile" {
  name = "skk-ec2-instance-profile"
  path = "/"
  role = "skk-iam-role-ec2-instance-bastion"
}
