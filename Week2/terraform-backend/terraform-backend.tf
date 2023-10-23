resource "aws_s3_bucket" "skk-s3-tf-state" {

  // 버킷 이름
  bucket = "comento-s3-bucket-skkuser"

  // 태그명
  tags = {
    "Name" = "comento-s3-bucket-skkuser"
  }
  
}

resource "aws_dynamodb_table" "skk-ddb-tflock-state" {

  // 프로비저닝 전 S3 Bucket이 생성되어야 함
  depends_on = [aws_s3_bucket.skk-s3-tf-state]

  // 테이블 이름
  name = "comento-ddb-table-skkuser"

  // 파티션 키
  attribute {
    // 파티션 키 이름
    name = "LockID"

    // 문자열
    type = "S"
  }

  // 용량 모드 - 온디맨드 방식
  billing_mode = "PAY_PER_REQUEST"

  // 해쉬키 - 파티션 키를 사용
  hash_key = "LockID"

  // 태그
  tags = {
    "Name" = "comento-ddb-table-skkuser"
  }

}
