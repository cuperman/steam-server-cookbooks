# OpsWorks

## Create a Key Pair

Go to your [EC2 dashboard](https://us-west-1.console.aws.amazon.com/ec2/v2/home?region=us-west-1#KeyPairs:sort=keyName), choose your desired region, and create a key pair.

You will be prompted to download the .pem file. After downloading the file to your local machine, put it in your ~/.ssh directory, make sure it's only accessible by you, and create a public key using the `ssh-keygen -y` command.

Example:

```bash
$ mv ~/Desktop/jeff-aws.pem ~/.ssh
$ chmod 600 ~/.ssh/jeff-aws.pem
$ ssh-keygen -y > ~/.ssh/jeff-aws.pub
Enter file in which the key is (/Users/jeff/.ssh/id_rsa): /Users/jeff/.ssh/jeff-aws.pem
```

## Create a Security Group

Go to your [EC2 dashboard](https://us-west-1.console.aws.amazon.com/ec2/v2/home?region=us-west-1#KeyPairs:sort=keyName), choose your desired region, and create a security group with the following options:

**Security group name:** Steam-Dedicated-Server
**Description:** Steam dedicated server network rules
**VPC:** [default]

*Security group rules - Inbound*

**Type:** Custom UDP Rule, **Protocol:** UDP, **Port Range:** 27000 - 27030, **Source:** Anywhere 0.0.0.0/0
**Type:** Custom UDP Rule, **Protocol:** UDP, **Port Range:** 4380, **Source:** Anywhere 0.0.0.0/0

*Security group rules - Outbound*

**Type:** All traffic, **Protocol:** All, **Port Range:** 0 - 65535, **Source:** Anywhere 0.0.0.0/0

## Add Stack

Go to your [OpsWorks dashboard](https://console.aws.amazon.com/opsworks/home) and create a stack with the following options:

**Name:** [any]
**Region:** [same as key pair]
**VPC:** [default]
**Default subnet:** [default]
**Default operating system:** Amazon Linux [latest]
**Default root device type:** Instance store
**IAM role:** [default]
**Default SSH key:** [same as key pair]
**Default IAM instance profile:** [default]
**Hostname theme:** [any]
**Stack color:** [any]

Click on "advanced" and enter the following:

*Configuration Management*

**Chef version:** 11.10
**Use custom Chef cookbooks:** Yes
**Repository type:** Git
**Repository URL:** https://github.com/cuperman/steam-server-cookbooks.git
**Repository SSH key:** 
**Branch/Revision:** 
**Manage Berkshelf:** No
**OpsWorks Agent version:** [default]
**Custom JSON:**

*Security*

**Use OpsWorks security groups:** Yes

## Add Layer

In the side-panel menu of your newly created stack, click on Layers and create a new OpsWorks Layer with the following options:

**Layer type:** Custom
**Name:** Steam dedicated server
**Short name:** steam_server

Then, under Steam dedicated server, click the "Recipes" tab, and add a recipe to the setup section of the Custom Chef Recipes. For example, to install Counter-Strike: GO, enter "steamcmd::csgo"

Under the "EBS Volumes" tab, mount a 30GB volume to /opt/steamcmd

Under the "Security" tab, add "Steam-Dedicated-Server" to the list of security groups

## Start Instance

In the instances menu of your stack, you can create new instances. Once started, they will automatically install and start the Steam dedicated server.

## SSH Access

You can ssh into the VM by using your key pair:

```bash
$ ssh -i jeff-aws.pem ec2-user@INSTANCE_PUBLIC_DNS
```
