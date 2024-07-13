terraform {
    backend "s3" {
        bucket = "batmannnnnnnnnn"
        key = "tfstate"
        region = "ap-south-1"
        dynamodb_table = "my-dynamodb-table"
    }
}
