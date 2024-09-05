# Introduction
Migrating from cPanel to AWS is a strategic move for businesses and developers looking to future-proof their WordPress websites. While cPanel is a popular and user-friendly hosting control panel, it has limitations in terms of scalability, performance, and flexibility. As your website grows and demands more resources, the need for a more robust and scalable hosting solution becomes essential.
AWS (Amazon Web Services) offers an unparalleled level of flexibility, reliability, and power, making it an ideal platform for hosting WordPress sites. Unlike traditional hosting environments managed through cPanel, AWS provides the ability to tailor your infrastructure to your exact needs, ensuring your website can handle traffic spikes, maintain high availability, and secure sensitive data effectively.
By moving to AWS, you gain access to a vast ecosystem of cloud services, including automated backups, advanced security features, global content delivery networks (CDNs), and seamless scalability. This transition not only enhances your site's performance and security but also allows you to pay only for the resources you use, offering significant cost savings in the long run. In essence, migrating from cPanel to AWS is about empowering your WordPress site with the tools and resources it needs to thrive in a dynamic, competitive online environment.

# Why Migrate To AWS?
Migrating your WordPress site to AWS EC2 provides numerous benefits:
•	Scalability: Easily scale your resources as your traffic grows.
•	Reliability: AWS offers a robust infrastructure with high availability.
•	Security: Leverage AWS's extensive security features.
•	Cost-Efficiency: Pay only for what you use, with the ability to optimize costs.

# Prerequisites
Before you begin the migration process, ensure you have the following:
•	Access to your current WordPress site via cPanel.
•	An active AWS account.
•	Basic understanding of AWS services and WordPress management.
•	Familiarity with SSH and file transfer tools (e.g., FileZilla, WinSCP)

# Step 1: Backup Your WordPress Site
Before migrating, it's crucial to create a full backup of your WordPress site, including:
1.	Files: Use cPanel's File Manager or an FTP client to download all files from the public_html directory.
2.	Database: In cPanel, go to phpMyAdmin, select your WordPress database, and export it as a .sql file.
Store these backups securely on your local machine.

# Step 2: Launch an EC2 Instance with WordPress AMI
1.	Log in to AWS Management Console:
•	Navigate to the EC2 Dashboard.
•	Click "Launch Instance."
2.	Choose an AMI:
•	Search for "WordPress Certified by Bitnami and Automattic" in the AWS Marketplace.
•	Select the appropriate version and click "Continue."
3.	Choose an Instance Type:
•	For small to medium traffic sites, a t2.micro/free tier instance (eligible for the AWS Free Tier) is sufficient. For larger sites, consider a more powerful instance.
•	Create Key pair
4.	Configure Instance Settings:
•	Set the network and security options according to your requirements.
•	Ensure SSH access is enabled by setting up a key pair.
5.	Add Storage:
•	The default storage is usually enough, but you can increase the size based on your site’s needs.
6.	Launch the Instance:
•	Review your settings and click "Launch."
•	Can access this instance in the browser using its Public IPv4 address
•	Once launched, note down the public IP address of your instance.

# Step 3: Configure Your EC2 Instance
1.	Connect to Your EC2 Instance:
•	Use SSH to connect to your instance. The command will look something like this: ssh -i "your-key.pem" bitnami@your-ec2-ip
•	Make the website secure => sudo /opt/bitnami/bncert-tool
2.	Access the WordPress Directory:
•	Navigate to the WordPress directory, typically located at /opt/bitnami/apps/wordpress/htdocs/.

# Step 4: Migrate Your Files and Database
1.	Transfer Files:
•	Use an SCP client or FTP to upload your WordPress files (from the backup) to the /htdocs/ directory on your EC2 instance.
2.	Import the Database:
•	Log in to phpMyAdmin on your EC2 instance (access it via http://your-ec2-ip/phpmyadmin).
•	Drop the existing database tables to avoid conflicts and then import your .sql backup.
3.	Update the wp-config.php File:
•	Modify the wp-config.php file with your new database credentials. This includes updating the database name, username, and password.

# Step 5: Point Your Domain to AWS
1.	Update DNS Settings:
•	In your domain registrar's dashboard, update the A record to point to your new EC2 instance's IP address.
2.	Test the Migration:
•	Access your website via the domain name to ensure everything is working correctly.
•	Check for broken links, missing images, or any other issues.

# Step 6: Secure Your WordPress Site on AWS
1.	Install SSL:
•	You can use Let's Encrypt to install a free SSL certificate on your site. Bitnami provides an automated tool for this purpose.
2.	Configure Security Groups:
•	Ensure your EC2 instance's security groups allow traffic only on necessary ports (80 for HTTP, 443 for HTTPS).
3.	Enable Backups:
•	Set up automated backups using AWS services like AWS Backup or manually configure cron jobs.

# Conclusion
Migrating your WordPress site from cPanel to AWS EC2 using the WordPress Certified by Bitnami and Automattic AMI can seem daunting, but following these steps will help you achieve a seamless migration. 

# Final Tips
•	Regularly monitor your EC2 instance’s performance through AWS CloudWatch.
•	Optimize your WordPress site using caching plugins and a CDN like Amazon CloudFront.
•	Keep your WordPress installation and plugins up to date for security and performance benefits.

