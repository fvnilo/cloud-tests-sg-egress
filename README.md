# cloud-tests-sg-egress
> A simple example to showcase SGs egress rules

The goal of this test was to show colleagues that AWS security groups do not always need an egress rule and that they are state full

## Getting Started

1. Create a `.auto.tfvars` file with these values

    ```
    home_cidr_block = #YOUR_CURRENT_IP/32
    key_pair_name   = #YOUR_KEYPAIR_NAME
    ```
    
2. Apply the configuration

    ```
    terraform apply
    ```
    
3. Use the outputs to connect to the database. I personally used SSH to bind a local port to my database. Then I use [pgcli](https://www.pgcli.com/) to connect to the database.

    ```
    ssh -L -f -N  5432:<DB_URL>:5432 ec2-user@<EC2_DNS> -i <PATH_TO_YOUR_KEY>
    pgcli postgresql://<USER>:<PASSWORD>@localhost:5432/postgres
    ```
