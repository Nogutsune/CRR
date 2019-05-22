# SingleSignOn for Qube

We are using multiple AWS account  for different purpose based on different Qube Products and different environment (Staging, Production etc). For every account a user has to create and maintain user id and credentials  (or devops team has to create IAM user for different user) for the access to the account. So in general every user require access to at least 2-3 accounts. Along with we use some business applications like Jenkins, Slack etc, for accessing that as well we require to maintain user id and password. SingleSignOn provides a centralized platform for accessing multiple aws accounts as well as business application. 

For SSO service we are opting for AWS SingleSignOn because of following reason :

1. AWS SSO is a free service as it provides highly available SSO service without the upfront investment and on-going maintenance costs of operating our own SSO infrastructure.
2. AWS SSO provide the option to create and manage our users within AWS SSO or connect to exiting Active Directory.
3. AWS SSO is easy to use as is no additional infrastructure to deploy or maintain. All administrative and SSO activity is recorded in AWS CloudTrail, helping us meet our audit and compliance requirements.
4. The AWS SSO application configuration wizard helps us extend SSO access to any application that supports Security Assertion Markup Language (SAML) 2.0.

### Prerequisites for AWS SSO

1. The first prerequisite is to set up the AWS Organizations service and have All features set to enabled. 
2. Sign in with the AWS Organizations master account credentials before we begin setting up AWS SSO. 
3. The last prerequisite is to either choose to use the default AWS SSO directory or create a new Active Directory on AWS or connect to existing Active Directory for our user store.             

Since we already have on-premise Active Directory for Office 365 so we planned to utilise that and connect to on-premise AD to AWS via AD Connector.

### AD Connector setup

AD Connector is a directory gateway that can redirect directory requests to our on-premises Active Directory without caching any information in the cloud. 
Following are the steps to setup AD Connector with On Premise AD :-
1. Create a VPC with at least 2 subnets.
2. Create VPC-VPN tunnel to create connection between newly created VPC and AD network.
3. Delegate privileges to our service account. It means create an access credentails for AD connector in the onpremise AD.
4. Create the ADConnector [follow the link](https://docs.aws.amazon.com/directoryservice/latest/admin-guide/create_ad_connector.html)

### AWS SSO setup 

1. Sign in to the AWS Management Console with our AWS Organizations master account credentials and open the AWS SSO console.
2. Choose Enable AWS SSO.
3. Choosing a directory determines where AWS SSO looks for users and groups that need SSO access. Select the AD Connector which we created earlier
4. Now we can grant users in our directory with SSO access to one or more AWS consoles for specific AWS accounts in our AWS organization. [For more Details](https://docs.aws.amazon.com/singlesignon/latest/userguide/useraccess.html#assignusers)

### Setup SSO to Business Application

The are usually two types of application :- **Cloud Application** (for which AWS SSO has integration support) or **Custom SAML 2.0 Application** .Depending upon which type of application we are setting up with SSO we have 

1. In the AWS SSO console, choose **Applications** in the left navigation pane. Then choose **Add a new application**.
2. In the **Select an application** dialog box, select the application we want to add from the list. Then choose **Add**.
                                                           <br/>or<br/>
   In the **Select an application** dialog box, select **Custom SAML 2.0 application** from the list. Then choose **Configure application**.                       
3. On the **Configure < application name >** page, under **Details**, type a **Display name** for the application, such as **Slack**.
                                                           <br/>or<br/>
   On the **Configure < Custom app name >** page, under **Details**, type a **Display name** for the application, such as **Jarvis Jenkins**.                                                        
4. Under **AWS SSO metadata**, do the following: <br/>
  a. Next to **AWS SSO SAML metadatafile**, choose **Download** to download the identity provider metadata.<br/>
  b. Next to **AWS SSO certificate**, choose **Download certificate** to download the identity provider certificate.
5. (Optional) Under **Application properties**, we can specify additional properties for the **Application start URL, Relay State,** and **Session Duration**. For more information, see [Application Properties](https://docs.aws.amazon.com/singlesignon/latest/userguide/appproperties.html).
6. Under **Application metadata**, provide the **Application ACS URL** and **Application SAML audience** values.
7. Choose **Save** changes to save the configuration.

### Steps for providing access to AWS SSO for newly onboarded member

As soon as the IT team has created new credentials for newly joined person and added in the onpremise Active Directory, we can map the person's username for AD with IAM role access for all required AWS consoles, then the new member can login the AWS console with his Active Directory credentials (same as office365).

### Steps for revoking access to AWS SSO for newly onboarded member

On deleting the credentails of user from onpremise Active Directory, the user will no longer have access to AWS console, Jenkins , Slack or any other business application under SSO. No extra step required for revoking user access.
