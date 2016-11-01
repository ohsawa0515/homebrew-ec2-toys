require 'formula'

VERSION="0.0.1"
class Ec2Toys < Formula
  desc ""
  homepage "https://github.com/ohsawa0515/ec2-toys"
  head 'https://github.com/ohsawa0515/ec2-toys.git', :branch => 'master'
  version VERSION

  if OS.mac?
    if Hardware::CPU.is_64_bit?
      url "https://github.com/ohsawa0515/ec2-toys/releases/download/v#{VERSION}/darwin_amd64.zip"
      sha256 "000fcf2a1e0ad58a1c8c6e7ff3ca9a97de81cd605d4d569ca345b29b77bfd5f8"
    else 
      url "https://github.com/ohsawa0515/ec2-toys/releases/download/v#{VERSION}/darwin_386.zip"
      sha256 "0f9b67e5f9ecde74369bd6da59fdc39a59398c0e5dad105ed9cc2d488d0005b9"
    end
  end

  def install
    bin.install 'ec2-toys'
  end

  # show message after installation.
  def caveats
    msg = <<-'EOF'
1. Please set AWS credentials(please ignore if you use IAM Roles).
Please choose one of the following methods: (i ~ ii).

i. Credentials file ($HOME/.aws/credentials)

```
[default]
aws_access_key_id = <YOUR_ACCESS_KEY_ID>
aws_secret_access_key = <YOUR_SECRET_ACCESS_KEY>
```

If you want to use profile, and set as follows.

```
[default]
aws_access_key_id = <YOUR_ACCESS_KEY_ID>
aws_secret_access_key = <YOUR_SECRET_ACCESS_KEY>

[dev]
aws_access_key_id = <YOUR_ACCESS_KEY_ID>
aws_secret_access_key = <YOUR_SECRET_ACCESS_KEY>
```

ii. Environment variable

```
$ export AWS_ACCESS_KEY_ID=YOUR_ACCESS_KEY_ID
$ export AWS_SECRET_ACCESS_KEY=YOUR_SECRET_ACCESS_KEY
```

2. Plese set AWS region.
Please choose one of the following methods: (i ~ ii).

i. Shared config ($HOME/.aws/config)

[default]
region = us-east-1

If you want to use profile, and set as follows.

```
[default]
region = us-east-1

[dev]
region = us-east-1
```

ii. Environment variable

```
$ export AWS_REGION=us-east-1
```
EOF
  end
end
