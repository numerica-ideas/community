# Migrate Wordpress Site From Cpanel To AWS

# Introduction
Migrating from cPanel to AWS is a strategic move for businesses and developers looking to future-proof their WordPress websites. While cPanel is a popular and user-friendly hosting control panel, it has limitations in terms of scalability, performance, and flexibility. As your website grows and demands more resources, the need for a more robust and scalable hosting solution becomes essential.

## Why Migrate To AWS?
Migrating your WordPress site to AWS EC2 provides numerous benefits:
-	Scalability: One of the most significant advantages of hosting your WordPress site on AWS EC2 is the ability to scale your resources seamlessly as your website grows. With traditional cPanel hosting, you are often confined to the resources (CPU, RAM, storage) of a single server, and upgrading can be cumbersome, requiring a move to a higher-tier plan or even a server migration. AWS EC2 offers elastic scalability, meaning you can easily add or reduce resources based on real-time traffic demand.
-	Reliability: AWS’s infrastructure is designed to be highly available and fault-tolerant. Amazon EC2 operates within Amazon’s global data centers, which are spread across different geographic regions and availability zones. This architecture allows you to deploy WordPress on multiple instances across these regions
-	Security: Security is a major concern for any website owner, especially for WordPress sites, which are frequent targets of cyberattacks due to their widespread use. AWS provides a variety of built-in security features that go beyond what cPanel hosting offers which is network security, encryption and automatic security updates.
-	Cost-Efficiency: With cPanel hosting, you're typically paying a fixed fee for a set amount of resources, whether you fully utilize them or not. This model may result in overpaying for resources you don’t need or require frequent upgrades as your site grows. AWS operates on a pay-as-you-go pricing model, where you only pay for the resources you consume. This flexibility allows you to optimize your costs based on actual usage.

## Prerequisites
Before you begin the migration process, ensure you have the following:
-	Access to your current WordPress site via cPanel.
-	An active AWS account.
-	Basic understanding of AWS services and WordPress management.
-	Familiarity with SSH and file transfer tools (e.g., FileZilla, WinSCP)

## Step 1: Backup Your WordPress Site
![alt text](images/image.png)
Before migrating, it's crucial to create a full backup of your WordPress site, including:
1.	Files: Use cPanel's File Manager or an FTP client to download all files from the public_html directory.
2.	Database: In cPanel, go to phpMyAdmin, select your WordPress database, and export it as a .sql file.
Store these backups securely on your local machine.

## Step 2: Launch an EC2 Instance with WordPress AMI
1.	Log in to AWS Management Console:
-	Navigate to the EC2 Dashboard.
-	Click "Launch Instance."
![alt text](images/image2.png)
2.	Choose an AMI:
-	Search for "WordPress Certified by Bitnami and Automattic" in the AWS Marketplace.
-	Select the appropriate version and click "Continue."
![alt text](images/image3.png)
![alt text](images/image4.png)
![alt text](images/image5.png)
3.	Choose an Instance Type:
-	For small to medium traffic sites, a t2.micro/free tier instance (eligible for the AWS Free Tier) is sufficient. For larger sites, consider a more powerful instance.
-	Create Key pair
![alt text](images/image6.png)
4.	Configure Instance Settings:
-	Set the network and security options according to your requirements.
-	Ensure SSH access is enabled by setting up a key pair.
![alt text](images/image7.png)
5.	Add Storage:
-	The default storage is usually enough, but you can increase the size based on your site’s needs.
![alt text](images/image8.png)
6.	Launch the Instance:
-	Review your settings and click "Launch."
![alt text](images/image9.png)
-	Can access this instance in the browser using its Public IPv4 address
![alt text](images/image10.png)
-	Once launched, note down the public IP address of your instance.
![alt text](images/image11.png)

## Step 3: Configure Your EC2 Instance
1.	Connect to Your EC2 Instance:
-	Use SSH to connect to your instance. The command will look something like this: ssh -i "your-key.pem" bitnami@your-ec2-ip
![alt text](images/image12.png)
-	Make the website secure => sudo /opt/bitnami/bncert-tool
![alt text](images/image13.png)
2.	Access the WordPress Directory:
-	Navigate to the WordPress directory, typically located at /opt/bitnami/apps/wordpress/htdocs/.

## Step 4: Migrate Your Files and Database
1.	Transfer Files:
-	Use an SCP client or FTP to upload your WordPress files (from the backup) to the /htdocs/ directory on your EC2 instance.
![alt text](images/image14.png)
2.	Import the Database:
-	Log in to phpMyAdmin on your EC2 instance (access it via http://your-ec2-ip/phpmyadmin).
-   Create a new database with the same name as your backup database. 
-	Import your .sql backup to the new database.
![alt text](images/image15.png)
3.	Update the wp-config.php File:
-	Modify the wp-config.php file with your new database credentials. This includes updating the database name, username, and password.
![alt text](images/image16.png)

## Step 5: Point Your Domain to AWS
1.	Update DNS Settings:
-	Create Hosted Zone in Route 53 service to connect domain name to EC2 instance.
![alt text](images/image17.png)
-	In your domain registrar's dashboard, update the A record to point to your new EC2 instance's IP address.
![alt text](images/image18.png)
![alt text](images/image19.png)
2.	Test the Migration:
-	Access your website via the domain name to ensure everything is working correctly.
-	Check for broken links, missing images, or any other issues.
![alt text](images/image20.png)

## Step 6: Secure Your WordPress Site on AWS
1.	Install SSL:
-	You can use Let's Encrypt to install a free SSL certificate on your site. Bitnami provides an automated tool for this purpose.
2.	Configure Security Groups:
-	Ensure your EC2 instance's security groups allow traffic only on necessary ports (80 for HTTP, 443 for HTTPS).
3.	Enable Backups:
-	Set up automated backups using AWS services like AWS Backup or manually configure cron jobs.

## Final Tips
-	Regularly monitor your EC2 instance’s performance through AWS CloudWatch.
-	Optimize your WordPress site using caching plugins and a CDN like Amazon CloudFront.
-	Keep your WordPress installation and plugins up to date for security and performance benefits.

## Conclusion
Migrating your WordPress site from cPanel to AWS EC2 using the WordPress Certified by Bitnami and Automattic AMI can seem daunting, but following these steps will help you achieve a seamless migration. 


