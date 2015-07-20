# OpsWorks

## Create a Key Pair

Go to your [EC2 dashboard](https://us-west-1.console.aws.amazon.com/ec2/v2/home?region=us-west-1#KeyPairs:sort=keyName), and create a key pair for a particular region (US West, for example)

You will be prompted to download the .pem file. After downloading the file to your local machine, put it in your ~/.ssh directory, and create a public key using the `ssh-keygen -y` command.

Example:

```bash
$ mv ~/Desktop/jeff-aws.pem ~/.ssh
$ ssh-keygen -y > ~/.ssh/jeff-aws.pub
Enter file in which the key is (/Users/jeff/.ssh/id_rsa): /Users/jeff/.ssh/jeff-aws.pem
```

## Add Stack

Go to your OpsWorks dashboard(https://console.aws.amazon.com/opsworks/home) and create a stack with the following options:

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

Click on advanced and enter the following:

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

Now, under Steam dedicated server, click the Recipes tab, and add "steamcmd::default" to the setup section of the Custom Chef Recipes.

Under the EBS Volumes tab, mount a 30GB volume to /opt/steamcmd

## Start Instance

In the instances menu of your stack, you can create new instances. Once started, they will automatically install and start the Steam dedicated server. If it fails, you will be shown a failure log. You can ssh into the VM to debug by using your key pair:

```bash
$ ssh -i jeff-aws.pem ec2-user@INSTANCE_PUBLIC_DNS
```
