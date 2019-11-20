# Task-2

Create a 3 tier architecture for hosting an application on Azure using terraform. All the resources need to be created through terraform.

This should contain 3 subnets.

Subnet 1 should be accessible directly from the internet and should have outbound internet connectivity.

Subnet 2 shouldn't be accessed directly from the internet and should only have inbound connectivity from subnet1.  Subnet2 can have outbound internet connectivity.

Subnet 3 should only be accessible from subnet 2 with no outbound internet connectivity.


End result:

Create a bastion host in Subnet 1 - This server (Bastion server) should be responsible for accessing a server ( Server App) that you will have to create in subnet 2.

On (Server App) lying in subnet 2 you should be able to install PostgreSQL CLI. Any IP on this shall not be accessible from a public domain.

Create a Postgres database in subnet3 which shall only be accessed from (Server App) lying in subnet 2.
