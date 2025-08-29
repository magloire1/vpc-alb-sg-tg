provider "aws" {
    region = "us-east-1"
  
}

import {
  to = aws_instance.web
  id = "i-07ffdd6aa169c1008"
}
