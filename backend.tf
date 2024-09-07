terraform {
    backend "s3" {
        bucket = "saitama122"
        key = "tfstate"
        region = "ap-south-1"
        dynamodb_table = "my-dynamodb-table"
    }
}
